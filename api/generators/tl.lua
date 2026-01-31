local function mkdir(path)
  if lovr.system.getOS() == 'Windows' then
    os.execute('mkdir ' .. path:gsub('/', '\\'))
  else
    os.execute('mkdir -p ' .. path)
  end
end

local function writeFile(path, contents)
  local file = assert(io.open(path, 'w'))
  file:write(contents)
  file:close()
end

local function trim(s)
  return (s:gsub('^%s+', ''):gsub('%s+$', ''))
end

local function splitUnion(typeStr)
  local parts = {}
  local depth = 0
  local start = 1
  for i = 1, #typeStr do
    local c = typeStr:sub(i, i)
    if c == '{' or c == '(' or c == '<' then
      depth = depth + 1
    elseif c == '}' or c == ')' or c == '>' then
      depth = depth - 1
    elseif c == '|' and depth == 0 then
      table.insert(parts, trim(typeStr:sub(start, i - 1)))
      start = i + 1
    end
  end
  table.insert(parts, trim(typeStr:sub(start)))
  return parts
end

local function stripOuterParens(typeStr)
  local s = trim(typeStr)
  if s:sub(1, 1) ~= '(' or s:sub(-1) ~= ')' then
    return s
  end
  local depth = 0
  for i = 1, #s do
    local c = s:sub(i, i)
    if c == '(' then
      depth = depth + 1
    elseif c == ')' then
      depth = depth - 1
      if depth == 0 and i < #s then
        return s
      end
    end
  end
  if depth == 0 then
    return trim(s:sub(2, -2))
  end
  return s
end

local function capitalize(part)
  if part == '' then return '' end
  return part:sub(1, 1):upper() .. part:sub(2)
end

local function normalizeContextPart(part)
  local name = ''
  local s = tostring(part or '')
  for word in s:gmatch('%w+') do
    name = name .. capitalize(word)
  end
  if name == '' then
    name = 'Value'
  end
  return name
end

local function makeTypeName(base, used)
  local parts = {}
  for part in base:gmatch('[%w]+') do
    parts[#parts + 1] = capitalize(part)
  end
  local name = table.concat(parts)
  if name == '' then name = 'Type' end
  if name:match('^%d') then
    name = 'T' .. name
  end
  local suffix = 2
  local unique = name
  while used[unique] do
    unique = name .. suffix
    suffix = suffix + 1
  end
  used[unique] = true
  return unique
end

return function(api)
  local preamble = {}
  local enumDefs = {}
  local objectDefs = {}
  local moduleDefs = {}
  local lovrDefs = {}
  local lovrNestedDefs = {}
  local moduleNestedDefs = {}
  local tableTypeDefs = {}
  local enums = {}
  local objects = {}
  local modules = {}
  local callbacks = api.callbacks or {}

  local objectNames = {}
  local enumNames = {}
  local recordNames = {}
  local usedTypeNames = {}

  for _, module in ipairs(api.modules) do
    for _, enum in ipairs(module.enums) do
      enumNames[enum.name] = true
      usedTypeNames[enum.name] = true
      table.insert(enums, enum)
    end
    for _, object in ipairs(module.objects) do
      objectNames[object.name] = true
      recordNames[object.name] = true
      usedTypeNames[object.name] = true
      table.insert(objects, object)
    end
    table.insert(modules, module)
  end

  local objectByName = {}
  for _, object in ipairs(objects) do
    objectByName[object.name] = object
  end

  local function collectObjectMethods(object)
    local list = {}
    local indexByName = {}
    local visited = {}

    local function visit(obj)
      if not obj or visited[obj.name] then
        return
      end
      visited[obj.name] = true
      if obj.extends then
        visit(objectByName[obj.extends])
      end
      for _, method in ipairs(obj.methods or {}) do
        local idx = indexByName[method.name]
        if idx then
          list[idx] = method
        else
          indexByName[method.name] = #list + 1
          list[#list + 1] = method
        end
      end
    end

    visit(object)
    return list
  end

  local function addLovrNestedRecord(name, fields)
    lovrNestedDefs[#lovrNestedDefs + 1] = '  record ' .. name
    for _, field in ipairs(fields) do
      lovrNestedDefs[#lovrNestedDefs + 1] = '    ' .. field
    end
    lovrNestedDefs[#lovrNestedDefs + 1] = '  end\n'
  end

  local function makeLovrNestedName(base)
    local baseName = capitalize(base or '')
    if baseName == '' then baseName = 'Type' end
    local qualified = 'lovr.' .. baseName
    local unique = qualified
    local suffix = 2
    while usedTypeNames[unique] do
      baseName = capitalize(base or '') .. suffix
      unique = 'lovr.' .. baseName
      suffix = suffix + 1
    end
    usedTypeNames[unique] = true
    return unique, baseName
  end

  local function addModuleNestedRecord(moduleType, name, fields)
    local list = moduleNestedDefs[moduleType]
    if not list then
      list = {}
      moduleNestedDefs[moduleType] = list
    end
    list[#list + 1] = '  record ' .. name
    for _, field in ipairs(fields) do
      list[#list + 1] = '    ' .. field
    end
    list[#list + 1] = '  end\n'
  end

  local function makeModuleNestedName(moduleType, base)
    local root = normalizeContextPart(base)
    local baseName = root ~= '' and root or 'Type'
    local qualified = moduleType .. '.' .. baseName
    local suffix = 2
    while usedTypeNames[qualified] do
      baseName = root .. suffix
      qualified = moduleType .. '.' .. baseName
      suffix = suffix + 1
    end
    usedTypeNames[qualified] = true
    return qualified, baseName
  end

  local function makeModuleContext(moduleType, functionName)
    return {
      nested = 'module',
      module = moduleType,
      base = normalizeContextPart(functionName or '')
    }
  end

  local function extendContext(context, fieldName)
    if type(context) == 'table' and context.base then
      local suffix = normalizeContextPart(fieldName)
      if context.nested == 'lovr' then
        return {
          base = context.base .. suffix,
          nested = 'lovr'
        }
      elseif context.nested == 'module' then
        return {
          base = context.base .. suffix,
          module = context.module,
          nested = 'module'
        }
      end
    end
    if type(context) == 'string' then
      if not fieldName or fieldName == '' then
        return context
      end
      return context .. '_' .. tostring(fieldName)
    end
    return fieldName or context
  end


  local needsWhere = {}
  local function collectUnionObjects(typeStr)
    if not typeStr or not typeStr:match('|') then return end
    local parts = splitUnion(typeStr)
    if #parts <= 1 then return end
    local hit = {}
    local count = 0
    for _, part in ipairs(parts) do
      if objectNames[part] then
        if not hit[part] then
          hit[part] = true
          count = count + 1
        end
      end
    end
    if count >= 2 then
      for name in pairs(hit) do
        needsWhere[name] = true
      end
    end
  end

  local function walkInfo(info)
    if not info then return end
    if info.type == 'function' then
      if info.arguments then
        for _, arg in ipairs(info.arguments) do
          walkInfo(arg)
        end
      end
      if info.returns then
        for _, ret in ipairs(info.returns) do
          walkInfo(ret)
        end
      end
    elseif info.type == 'table' and info.table then
      for _, field in ipairs(info.table) do
        walkInfo(field)
      end
    else
      collectUnionObjects(info.type)
    end
  end

  for _, module in ipairs(modules) do
    for _, fn in ipairs(module.functions) do
      for _, variant in ipairs(fn.variants) do
        for _, arg in ipairs(variant.arguments) do
          walkInfo(arg)
        end
        for _, ret in ipairs(variant.returns) do
          walkInfo(ret)
        end
      end
    end
    for _, object in ipairs(module.objects) do
      for _, method in ipairs(object.methods) do
        for _, variant in ipairs(method.variants) do
          for _, arg in ipairs(variant.arguments) do
            walkInfo(arg)
          end
          for _, ret in ipairs(variant.returns) do
            walkInfo(ret)
          end
        end
      end
    end
  end

  for _, callback in ipairs(callbacks) do
    for _, variant in ipairs(callback.variants) do
      for _, arg in ipairs(variant.arguments) do
        walkInfo(arg)
      end
      for _, ret in ipairs(variant.returns) do
        walkInfo(ret)
      end
    end
  end

  local hasTypeMethod = {}
  for _, object in ipairs(objects) do
    if object.name ~= 'Object' then
      for _, method in ipairs(collectObjectMethods(object)) do
        if method.name == 'type' then
          hasTypeMethod[object.name] = true
          break
        end
      end
    end
  end

  for name in pairs(hasTypeMethod) do
    needsWhere[name] = true
  end

  local tableTypes = {}
  local tableTypeForwards = {}

  local function tableShapeKey(tbl)
    local parts = {}
    for _, field in ipairs(tbl) do
      local key = field.name or ''
      local t = field.type or ''
      if field.table then
        t = t .. '(' .. tableShapeKey(field.table) .. ')'
      end
      parts[#parts + 1] = key .. ':' .. t
    end
    table.sort(parts)
    return table.concat(parts, ',')
  end


  local function isFunctionType(typeStr)
    local s = stripOuterParens(typeStr)
    return s == 'AnyFunction' or s:match('^function%s*%(') ~= nil
  end

  local function isTableType(typeStr)
    local s = stripOuterParens(typeStr)
    if s == 'table' then
      return true
    end
    if s:sub(1, 1) == '{' then
      return true
    end
    return recordNames[s] == true
  end

  local function normalizeUnionParts(parts)
    local seenParts = {}
    local seenNormalized = {}
    local normalized = {}
    local enumParts = {}
    local nonTableParts = {}
    local functionParts = {}
    local tableDisc = {}
    local tableNon = {}
    local hasAny = false
    local hasString = false

    local function addUnique(list, seen, value)
      if not seen[value] then
        seen[value] = true
        list[#list + 1] = value
      end
    end

    for _, raw in ipairs(parts) do
      local part = trim(raw)
      if part ~= '' then
        local s = stripOuterParens(part)
        if s == 'any' then
          hasAny = true
        elseif enumNames[s] then
          addUnique(enumParts, seenParts, s)
        elseif s == 'string' then
          hasString = true
        elseif isFunctionType(s) then
          addUnique(functionParts, seenParts, s)
        elseif isTableType(s) then
          if needsWhere[s] then
            addUnique(tableDisc, seenParts, s)
          else
            addUnique(tableNon, seenParts, s)
          end
        else
          addUnique(nonTableParts, seenParts, s)
        end
      end
    end

    if hasAny then
      return 'any'
    end

    if hasString then
      addUnique(normalized, seenNormalized, 'string')
    else
      if #enumParts == 1 then
        addUnique(normalized, seenNormalized, enumParts[1])
      elseif #enumParts > 1 then
        addUnique(normalized, seenNormalized, 'string')
      end
    end

    if #functionParts > 0 then
      addUnique(normalized, seenNormalized, 'AnyFunction')
    end

    local totalTables = #tableDisc + #tableNon
    if totalTables == 1 then
      if #tableNon == 1 then
        addUnique(normalized, seenNormalized, tableNon[1])
      else
        addUnique(normalized, seenNormalized, tableDisc[1])
      end
    elseif totalTables > 1 then
      if #tableNon > 0 then
        addUnique(normalized, seenNormalized, 'table')
      else
        for _, t in ipairs(tableDisc) do
          addUnique(normalized, seenNormalized, t)
        end
      end
    end

    for _, t in ipairs(nonTableParts) do
      addUnique(normalized, seenNormalized, t)
    end

    if #normalized == 0 then
      return 'any'
    elseif #normalized == 1 then
      return normalized[1]
    else
      return table.concat(normalized, ' | ')
    end
  end

  local function convertTypeString(typeStr)
    if not typeStr or typeStr == '' then return 'any' end
    typeStr = typeStr:gsub('%*', 'any')
    typeStr = typeStr:gsub('%f[%w]table%f[^%w]', 'table')
    typeStr = typeStr:gsub('%f[%w]function%f[^%w]', 'AnyFunction')
    typeStr = typeStr:gsub('%f[%w]lightuserdata%f[^%w]', 'userdata')
    typeStr = typeStr:gsub('%f[%w]vector%f[^%w]', 'Vec3')
    return normalizeUnionParts(splitUnion(typeStr))
  end

  local tableType

  local function isOptionalArg(arg)
    if arg.name and arg.name:sub(1, 3) == '...' then
      return false
    end
    if arg.type ~= 'table' then
      return arg.default ~= nil
    end
    if not arg.table then
      return arg.default ~= nil
    end
    for _, field in ipairs(arg.table) do
      if field.default == nil then
        return false
      end
    end
    return true
  end

  local function genInlineFunctionType(info, contextPrefix)
    if not info.arguments or not info.returns then
      return 'AnyFunction'
    end

    local args = {}
    local baseContext = contextPrefix or 'InlineFunction'
    local function wrapFunctionType(typeStr)
      if typeStr:match('^function') then
        return '(' .. typeStr .. ')'
      end
      return typeStr
    end

    for _, arg in ipairs(info.arguments) do
      local argType
      local argContext = extendContext(baseContext, arg.name or 'Arg')
      if arg.type == 'table' and arg.table then
        argType = tableType(arg.table, argContext)
      elseif arg.type == 'function' then
        argType = wrapFunctionType(genInlineFunctionType(arg, argContext))
      else
        argType = convertTypeString(arg.type)
      end

      if arg.name and arg.name:sub(1, 3) == '...' then
        args[#args + 1] = '...: ' .. argType
      else
        local suffix = isOptionalArg(arg) and '?' or ''
        local name = arg.name or '_'
        args[#args + 1] = ('%s%s: %s'):format(name, suffix, argType)
      end
    end

    local rets = {}
    for _, ret in ipairs(info.returns) do
      local retType
      local retContext = extendContext(baseContext, ret.name or 'Return')
      if ret.type == 'table' and ret.table then
        retType = tableType(ret.table, retContext)
      elseif ret.type == 'function' then
        retType = wrapFunctionType(genInlineFunctionType(ret, retContext))
      else
        retType = convertTypeString(ret.type)
      end

      if ret.name and ret.name:sub(1, 3) == '...' then
        rets[#rets + 1] = retType .. '...'
      else
        rets[#rets + 1] = retType
      end
    end

    local retlist
    if #rets == 0 then
      retlist = 'nil'
    elseif #rets == 1 then
      retlist = rets[1]
    else
      retlist = '(' .. table.concat(rets, ', ') .. ')'
    end

    return ('function(%s): %s'):format(table.concat(args, ', '), retlist)
  end

  local function emitLovrConf(tbl)
    local key = 'lovr.Conf:' .. tableShapeKey(tbl)
    if tableTypes[key] then
      return tableTypes[key]
    end

    local typeName = 'lovr.Conf'
    tableTypes[key] = typeName
    recordNames[typeName] = true
    usedTypeNames[typeName] = true

    lovrNestedDefs[#lovrNestedDefs + 1] = '  record Conf'

    -- nested records inside conf
    for _, field in ipairs(tbl) do
      if field.type == 'table' and field.table then
        local nestedName = capitalize(field.name)
        local nestedType = typeName .. '.' .. nestedName
        recordNames[nestedType] = true
        usedTypeNames[nestedType] = true

        lovrNestedDefs[#lovrNestedDefs + 1] = '    record ' .. nestedName
        for _, subfield in ipairs(field.table) do
          local subType
          if subfield.type == 'table' and subfield.table then
            subType = 'table'
          elseif subfield.type == 'function' then
            subType = genInlineFunctionType(subfield, 'Lovrconf' .. field.name .. (subfield.name or 'Field'))
          else
            subType = convertTypeString(subfield.type)
          end
          if subfield.default ~= nil and not subType:match('nil') then
            subType = subType .. ' | nil'
          end
          lovrNestedDefs[#lovrNestedDefs + 1] = ('      %s: %s'):format(subfield.name, subType)
        end
        lovrNestedDefs[#lovrNestedDefs + 1] = '    end\n'
      end
    end

    -- fields of conf
    for _, field in ipairs(tbl) do
      local fieldType
      if field.type == 'table' and field.table then
        fieldType = typeName .. '.' .. capitalize(field.name)
      elseif field.type == 'function' then
        fieldType = genInlineFunctionType(field, 'Lovrconf' .. (field.name or 'Field'))
      else
        fieldType = convertTypeString(field.type)
      end
      if field.default ~= nil and not fieldType:match('nil') then
        fieldType = fieldType .. ' | nil'
      end
      lovrNestedDefs[#lovrNestedDefs + 1] = ('    %s: %s'):format(field.name, fieldType)
    end

    lovrNestedDefs[#lovrNestedDefs + 1] = '  end\n'
    return typeName
  end

  tableType = function(tbl, context)
    context = context or 'Table'
    local key = tableShapeKey(tbl)
    local isLovrNested = type(context) == 'table' and context.nested == 'lovr'
    local isModuleNested = type(context) == 'table' and context.nested == 'module' and context.module
    if isLovrNested then
      if context.base == 'Conf' then
        return emitLovrConf(tbl)
      end
      key = 'lovr:' .. key
    elseif isModuleNested then
      key = ('module:%s:%s:%s'):format(context.module, context.base or '', key)
    end
    if tableTypes[key] then
      return tableTypes[key]
    end

    local contextBase = (isLovrNested or isModuleNested) and context.base or context

    local isArrayStruct = true
    local isTuple = true
    local isArrayTuple = true
    for _, field in ipairs(tbl) do
      if not (field.name and field.name:match('^%[%]%..+')) then
        isArrayStruct = false
      end
      if not (field.name and field.name:match('^%[%d+%]$')) then
        isTuple = false
      end
      if not (field.name and field.name:match('^%[%]%[%d+%]$')) then
        isArrayTuple = false
      end
    end

    if isArrayTuple then
      local items = {}
      table.sort(tbl, function(a, b)
        local ai = tonumber(a.name:match('%[%]%[(%d+)%]'))
        local bi = tonumber(b.name:match('%[%]%[(%d+)%]'))
        return ai < bi
      end)
      for _, field in ipairs(tbl) do
        local itemType
        if field.type == 'table' and field.table then
          local child = extendContext(context, field.name)
          itemType = tableType(field.table, child)
        elseif field.type == 'function' then
          itemType = genInlineFunctionType(field, extendContext(context, field.name))
        else
          itemType = convertTypeString(field.type)
        end
        items[#items + 1] = itemType
      end
      local tupleType = '{' .. table.concat(items, ', ') .. '}'
      local arrayType = '{' .. tupleType .. '}'
      tableTypes[key] = arrayType
      return arrayType
    end

    if isArrayStruct then
      local fields = {}
      for _, field in ipairs(tbl) do
        local name = field.name:sub(4)
        local fieldType
        if field.type == 'table' and field.table then
          local child = extendContext(context, name)
          fieldType = tableType(field.table, child)
        elseif field.type == 'function' then
          fieldType = genInlineFunctionType(field, extendContext(context, name))
        else
          fieldType = convertTypeString(field.type)
        end
        if field.default ~= nil and not fieldType:match('nil') then
          fieldType = fieldType .. ' | nil'
        end
        fields[#fields + 1] = { name = name, type = fieldType }
      end

      if isLovrNested then
        local qualified, baseName = makeLovrNestedName(contextBase .. 'Item')
        recordNames[qualified] = true
        tableTypes[key] = '{' .. qualified .. '}'
        local fieldLines = {}
        for _, field in ipairs(fields) do
          fieldLines[#fieldLines + 1] = ('%s: %s'):format(field.name, field.type)
        end
        addLovrNestedRecord(baseName, fieldLines)
        return tableTypes[key]
      elseif isModuleNested then
        local qualified, baseName = makeModuleNestedName(context.module, contextBase .. 'Item')
        recordNames[qualified] = true
        tableTypes[key] = '{' .. qualified .. '}'
        local fieldLines = {}
        for _, field in ipairs(fields) do
          fieldLines[#fieldLines + 1] = ('%s: %s'):format(field.name, field.type)
        end
        addModuleNestedRecord(context.module, baseName, fieldLines)
        return tableTypes[key]
      else
        local itemName = makeTypeName(contextBase .. 'Item', usedTypeNames)
        recordNames[itemName] = true
        tableTypeForwards[itemName] = true
        tableTypes[key] = '{' .. itemName .. '}'
        tableTypeDefs[#tableTypeDefs + 1] = 'global record ' .. itemName
        for _, field in ipairs(fields) do
          tableTypeDefs[#tableTypeDefs + 1] = ('  %s: %s'):format(field.name, field.type)
        end
        tableTypeDefs[#tableTypeDefs + 1] = 'end\n'
        return tableTypes[key]
      end
    end

    if isTuple then
      local items = {}
      table.sort(tbl, function(a, b)
        local ai = tonumber(a.name:match('%[(%d+)%]'))
        local bi = tonumber(b.name:match('%[(%d+)%]'))
        return ai < bi
      end)
      for _, field in ipairs(tbl) do
        local itemType
        if field.type == 'table' and field.table then
          local child = extendContext(context, field.name)
          itemType = tableType(field.table, child)
        elseif field.type == 'function' then
          itemType = genInlineFunctionType(field, extendContext(context, field.name))
        else
          itemType = convertTypeString(field.type)
        end
        items[#items + 1] = itemType
      end
      local tupleType = '{' .. table.concat(items, ', ') .. '}'
      tableTypes[key] = tupleType
      return tupleType
    end

    local fields = {}
    for _, field in ipairs(tbl) do
      local fieldType
      if field.type == 'table' and field.table then
        local child = extendContext(context, field.name)
        fieldType = tableType(field.table, child)
      elseif field.type == 'function' then
        fieldType = genInlineFunctionType(field, extendContext(context, field.name))
      else
        fieldType = convertTypeString(field.type)
      end
      if field.default ~= nil and not fieldType:match('nil') then
        fieldType = fieldType .. ' | nil'
      end
      fields[#fields + 1] = { name = field.name, type = fieldType }
    end

    if isLovrNested then
      local qualified, baseName = makeLovrNestedName(contextBase)
      recordNames[qualified] = true
      tableTypes[key] = qualified
      local fieldLines = {}
      for _, field in ipairs(fields) do
        fieldLines[#fieldLines + 1] = ('%s: %s'):format(field.name, field.type)
      end
      addLovrNestedRecord(baseName, fieldLines)
      return qualified
    elseif isModuleNested then
      local qualified, baseName = makeModuleNestedName(context.module, contextBase)
      recordNames[qualified] = true
      tableTypes[key] = qualified
      local fieldLines = {}
      for _, field in ipairs(fields) do
        fieldLines[#fieldLines + 1] = ('%s: %s'):format(field.name, field.type)
      end
      addModuleNestedRecord(context.module, baseName, fieldLines)
      return qualified
    else
      local typeName = makeTypeName(contextBase, usedTypeNames)
      recordNames[typeName] = true
      tableTypeForwards[typeName] = true
      tableTypes[key] = typeName
      tableTypeDefs[#tableTypeDefs + 1] = 'global record ' .. typeName
      for _, field in ipairs(fields) do
        tableTypeDefs[#tableTypeDefs + 1] = ('  %s: %s'):format(field.name, field.type)
      end
      tableTypeDefs[#tableTypeDefs + 1] = 'end\n'
      return typeName
    end
  end

  local function wrapFunctionType(typeStr)
    if typeStr:match('^function') then
      return '(' .. typeStr .. ')'
    end
    return typeStr
  end

  local function resolveInfoType(info, contextPrefix)
    if info.type == 'table' and info.table then
      if info.name == 't' and type(contextPrefix) == 'string' and contextPrefix:match('^Lovr_?conf') then
        return tableType(info.table, { base = 'Conf', nested = 'lovr' })
      end
      return tableType(info.table, contextPrefix)
    elseif info.type == 'function' then
      return genInlineFunctionType(info, contextPrefix)
    else
      return convertTypeString(info.type)
    end
  end

  local function genFunctionType(variant, selfType, contextPrefix)
    local prefix = contextPrefix or (selfType or 'Module')

    local args = {}
    if selfType then
      args[#args + 1] = 'self: ' .. selfType
    end

    for _, arg in ipairs(variant.arguments or {}) do
      local argContext = extendContext(prefix, arg.name or 'Arg')
      local argType = resolveInfoType(arg, argContext)
      argType = wrapFunctionType(argType)

      if arg.name and arg.name:sub(1, 3) == '...' then
        args[#args + 1] = '...: ' .. argType
      else
        local suffix = isOptionalArg(arg) and '?' or ''
        local name = arg.name or '_'
        args[#args + 1] = ('%s%s: %s'):format(name, suffix, argType)
      end
    end

    local rets = {}
    for _, ret in ipairs(variant.returns or {}) do
      local retContext = extendContext(prefix, ret.name or 'Return')
      local retType = resolveInfoType(ret, retContext)
      retType = wrapFunctionType(retType)

      if ret.name and ret.name:sub(1, 3) == '...' then
        rets[#rets + 1] = retType .. '...'
      else
        rets[#rets + 1] = retType
      end
    end

    local retlist
    if #rets == 0 then
      retlist = 'nil'
    elseif #rets == 1 then
      retlist = rets[1]
    else
      retlist = '(' .. table.concat(rets, ', ') .. ')'
    end

    return ('function(%s): %s'):format(table.concat(args, ', '), retlist)
  end

  -- Preamble
  preamble[#preamble + 1] = '-- Generated by `lovr api tl`'
  preamble[#preamble + 1] = ''
  preamble[#preamble + 1] = 'global type AnyFunction = function(...: any): any...'
  preamble[#preamble + 1] = ''

  if api then
    -- enums
    for _, enum in ipairs(enums) do
      enumDefs[#enumDefs + 1] = 'global enum ' .. enum.name
      for _, value in ipairs(enum.values) do
        enumDefs[#enumDefs + 1] = ('  %q'):format(value.name)
      end
      enumDefs[#enumDefs + 1] = 'end\n'
    end

    -- object types
    for _, object in ipairs(objects) do
      objectDefs[#objectDefs + 1] = 'global record ' .. object.name .. ' is userdata'
      if needsWhere[object.name] then
        objectDefs[#objectDefs + 1] = ('  where self:type() == %q'):format(object.name)
      end

    for _, method in ipairs(collectObjectMethods(object)) do
      for _, variant in ipairs(method.variants or {}) do
          objectDefs[#objectDefs + 1] = ('  %s: %s'):format(method.name, genFunctionType(variant, object.name, extendContext(object.name, method.name)))
      end
    end

      objectDefs[#objectDefs + 1] = 'end\n'
    end

    -- module types
    local moduleInterfaces = { lovr = 'lovr' }
    local skipExternal = { utf8 = true }
    usedTypeNames['lovr'] = true
    recordNames['lovr'] = true
    for _, module in ipairs(modules) do
      if module.key ~= 'lovr' then
        if not (module.external and skipExternal[module.name]) then
          local moduleName = module.name
          local typeName
          if module.external then
            typeName = moduleName
            usedTypeNames[typeName] = true
          else
            typeName = makeTypeName('Lovr ' .. moduleName .. ' Module', usedTypeNames)
          end
          moduleInterfaces[module.key] = typeName
          recordNames[typeName] = true

          moduleDefs[#moduleDefs + 1] = 'global record ' .. typeName
          for _, fn in ipairs(module.functions) do
            for _, variant in ipairs(fn.variants or {}) do
              moduleDefs[#moduleDefs + 1] = ('  %s: %s'):format(fn.name, genFunctionType(variant, nil, makeModuleContext(typeName, fn.name)))
            end
          end
          moduleDefs[#moduleDefs + 1] = 'end\n'
        end
      end
    end

    -- lovr module
    lovrDefs[#lovrDefs + 1] = 'global record lovr'
    for _, module in ipairs(modules) do
      if module.key == 'lovr' then
        for _, fn in ipairs(module.functions) do
          for _, variant in ipairs(fn.variants or {}) do
            lovrDefs[#lovrDefs + 1] = ('  %s: %s'):format(fn.name, genFunctionType(variant, nil, extendContext('Lovr', fn.name)))
          end
        end
      end
    end
    for _, cb in ipairs(callbacks) do
      for _, variant in ipairs(cb.variants or {}) do
        lovrDefs[#lovrDefs + 1] = ('  %s: %s'):format(cb.name, genFunctionType(variant, nil, extendContext('Lovr', cb.name)))
      end
    end
    for _, module in ipairs(modules) do
      if module.key ~= 'lovr' and not module.external then
        lovrDefs[#lovrDefs + 1] = ('  %s: %s'):format(module.name, moduleInterfaces[module.key])
      end
    end
    lovrDefs[#lovrDefs + 1] = 'end\n'
  end

  local directory = lovr.filesystem.getSource() .. '/tl'
  mkdir(directory)
  local forwardDefs = {}
  for name in pairs(objectNames) do
    forwardDefs[#forwardDefs + 1] = 'global type ' .. name
  end
  for name in pairs(tableTypeForwards) do
    forwardDefs[#forwardDefs + 1] = 'global type ' .. name
  end

  local out = {}
  local function append(section)
    for _, line in ipairs(section) do
      out[#out + 1] = line
    end
  end

  append(preamble)
  if #forwardDefs > 0 then
    append(forwardDefs)
    out[#out + 1] = ''
  end
  append(enumDefs)
  append(objectDefs)
  if next(moduleNestedDefs) then
    local injected = {}
    for _, line in ipairs(moduleDefs) do
      injected[#injected + 1] = line
      local name = line:match('^global record%s+([%w_]+)$')
      local nested = name and moduleNestedDefs[name]
      if nested then
        for _, nestedLine in ipairs(nested) do
          injected[#injected + 1] = nestedLine
        end
      end
    end
    moduleDefs = injected
  end
  append(moduleDefs)
  if #lovrNestedDefs > 0 then
    local injected = {}
    local inserted = false
    for _, line in ipairs(lovrDefs) do
      injected[#injected + 1] = line
      if not inserted and line:match('^global record lovr') then
        for _, nested in ipairs(lovrNestedDefs) do
          injected[#injected + 1] = nested
        end
        inserted = true
      end
    end
    lovrDefs = injected
  end
  append(lovrDefs)
  if #tableTypeDefs > 0 then
    out[#out + 1] = ''
    append(tableTypeDefs)
  end

  writeFile(directory .. '/lovr.d.tl', table.concat(out, '\n'))
end
