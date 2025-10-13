local preamble = [[
declare extern type userdata with end
declare extern type lightuserdata with end

declare extern type quaternion with
  x: number
  y: number
  z: number
  w: number
end

type Vec2 = {number}
type Vec3 = {number} | vector
type Vec4 = {number}
type Quat = {number} | quaternion
type Mat4 = {number}

declare class Joint end
declare class Shape end
]]

local genFunctionType

local function genType(info)
  local types = {}

  for t in info.type:gmatch('[%w{}%*%.]+') do
    if t == 'function' then
      table.insert(types, genFunctionType(info))
    elseif t == '*' then
      table.insert(types, 'any')
    elseif t == 'table' then
      table.insert(types, '{}')
    else
      table.insert(types, t)
    end
  end

  if #types == 1 then
    return types[1] .. (info.default and '?' or '')
  else
    return table.concat(types, ' | ') .. (info.default and ' | nil' or '')
  end
end

local function genArguments(arguments, ismethod)
  local t = {}

  for _, arg in ipairs(arguments) do
    local name, type = arg.name, genType(arg)

    if name:match('%.%.%.') then
      if ismethod then
        table.insert(t, '...: ' .. type)
      else
        table.insert(t, '...' .. type)
      end
    else
      table.insert(t, ('%s: %s'):format(name, type))
    end
  end

  return table.concat(t, ', ')
end

local function genReturns(returns)
  local t = {}

  for _, ret in ipairs(returns) do
    table.insert(t, genType(ret))
  end

  return table.concat(t, ', ')
end

genFunctionType = function(fn)
  if not fn.arguments or not fn.returns then
    return '() -> ()'
  end

  local args = genArguments(fn.arguments)
  local rets = genReturns(fn.returns)

  if #fn.returns == 1 and fn.returns[1].type ~= 'function' then
    return ('(%s) -> %s'):format(args, rets)
  else
    return ('(%s) -> (%s)'):format(args, rets)
  end
end

local function genMethod(method, variant)
  local args = genArguments(variant.arguments, true)
  local rets = genReturns(variant.returns)

  if args == '' then
    args = 'self'
  else
    args = 'self, ' .. args
  end

  if #variant.returns > 1 or rets:match('%(') then
    rets = (': (%s)'):format(rets)
  elseif #variant.returns == 1 then
    rets = ': ' .. rets
  end

  return ('  function %s(%s)%s'):format(method.name, args, rets)
end

return function(api)
  local directory = lovr.filesystem.getSource() .. '/luau'

  if lovr.system.getOS() == 'Windows' then
    os.execute('mkdir ' .. directory:gsub('/', '\\'))
  else
    os.execute('mkdir -p ' .. directory)
  end

  local out = {}

  local function write(s, ...)
    table.insert(out, s:format(...))
  end

  write(preamble:gsub('^%s*', ''))
  write('\n')

  local function writeFunction(fn)
    if #fn.variants > 1 then
      write('  %s:\n', fn.name)

      for i, variant in ipairs(fn.variants) do
        write('    & (%s)%s\n', genFunctionType(variant), i == #fn.variants and ',' or '')
      end
    else
      write('  %s: %s,\n', fn.name, genFunctionType(fn.variants[1]))
    end
  end

  for _, module in ipairs(api.modules) do
    for _, enum in ipairs(module.enums) do
      write('type %s =\n', enum.name)
      for _, value in ipairs(enum.values) do
        write('  | %q\n', value.name)
      end
      write('\n')
    end

    local ignore = {
      Vec2 = true,
      Vec3 = true,
      Vec4 = true,
      Quat = true,
      Mat4 = true,
      Vectors = true
    }

    for _, object in ipairs(module.objects) do
      if not ignore[object.name] then
        write('declare class %s', object.name)

        if object.extends then
          write(' extends %s', object.extends)
        end

        write('\n')

        for _, method in ipairs(object.methods) do
          for _, variant in ipairs(method.variants) do
            write('%s\n', genMethod(method, variant))
          end
        end

        write('end\n\n')
      end
    end

    if module.name ~= 'lovr' and #module.functions > 0 then
      write('type %sModule = {\n', module.name:gsub('^%l', string.upper))

      for _, fn in ipairs(module.functions) do
        writeFunction(fn)
      end

      write('}\n\n')
    end
  end

  write('declare lovr: {\n')

  for _, module in ipairs(api.modules) do
    if module.name == 'lovr' then
      for _, fn in ipairs(module.functions) do
        writeFunction(fn)
      end
    end
  end

  write('\n')

  for _, callback in ipairs(api.callbacks) do
    writeFunction(callback)
  end

  write('\n')

  for _, module in ipairs(api.modules) do
    if module.name ~= 'lovr' and #module.functions > 0 then
      write('  %s: %sModule,\n', module.name, module.name:gsub('^%l', string.upper))
    end
  end

  write('}\n')

  local file = assert(io.open(directory .. '/lovr.d.luau', 'w'))
  file:write(table.concat(out):sub(1, -2))
  file:close()
end
