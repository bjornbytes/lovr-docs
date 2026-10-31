local preamble = [[
declare extern type userdata with end
declare extern type lightuserdata with end
]]

local vectors = [[
declare extern type vector with
    read x: number
    read y: number
    read z: number
end

declare vector: {
    create: @checked (x: number, y: number, z: number?) -> vector,
    pack: @checked (x: number?, y: number?, z: number?) -> vector,
    unpack: @checked (vec: vector) -> (number, number, number),
    length: @checked (vec: vector) -> number,
    magnitude: @checked (vec: vector) -> number,
    normalize: @checked (vec: vector) -> vector,
    distance: @checked (vec1: vector, vec2: vector) -> number,
    cross: @checked (vec1: vector, vec2: vector) -> vector,
    dot: @checked (vec1: vector, vec2: vector) -> number,
    angle: @checked (vec1: vector, vec2: vector, axis: vector?) -> number,
    floor: @checked (vec: vector) -> vector,
    ceil: @checked (vec: vector) -> vector,
    abs: @checked (vec: vector) -> vector,
    sign: @checked (vec: vector) -> vector,
    clamp: @checked (vec: vector, min: vector, max: vector) -> vector,
    min: @checked (vector, ...vector) -> vector,
    max: @checked (vector, ...vector) -> vector,
    lerp: @checked (vec1: vector, vec2: vector, t: number) -> vector,
    rotate: @checked (vec: vector, quat: quaternion) -> vector,

    zero: vector,
    one: vector,
    left: vector,
    right: vector,
    up: vector,
    down: vector,
    forward: vector,
    back: vector,
    backward: vector,
}

declare extern type quaternion with
    x: number
    y: number
    z: number
    w: number
end

declare quaternion: {
    pack: @checked (x: number?, y: number?, z: number?, w: number?) -> quaternion,
    unpack: @checked (quat: quaternion) -> (number, number, number, number),
    conjugate: @checked (quat: quaternion) -> quaternion,
    angleaxis: @checked (angle: number, x: number, y: number, z: number) -> quaternion,
    toangleaxis: @checked (quat: quaternion) -> (number, number, number, number),
    euler: @checked (x: number, y: number, z: number) -> quaternion,
    toeuler: @checked (quat: quaternion) -> (number, number, number),
    between: @checked (v1: vector, v2: vector) -> quaternion,
    lookdir: @checked (forward: vector, up: vector?) -> quaternion,
    direction: @checked (quat: quaternion) -> vector,
    slerp: @checked (q1: quaternion, q2: quaternion, t: number) -> quaternion,

    identity: quaternion,
}
]]

local genFunction

local function genType(info)
  local types = {}
  local optional = info.default or info.type:find('?')

  for t in info.type:gmatch('[%w{}%*%.]+') do
    if t == 'function' then
      -- Need to wrap optional functions in parens so the ? doesn't apply to the return type
      table.insert(types, (optional and '(%s)' or '%s'):format(genFunction(info)))
    elseif t == '*' then
      table.insert(types, 'any')
    elseif t == 'table' and info.table then
      local fields = {}

      for _, field in ipairs(info.table) do
        table.insert(fields, ('%s: %s'):format(field.name:match('%w+$'), genType(field)))
      end

      fields = table.concat(fields, ', ')

      if info.table[1].name:match('%[%]') then
        table.insert(types, ('{{%s}}'):format(fields))
      else
        table.insert(types, ('{%s}'):format(fields))
      end
    elseif t == 'table' then
      table.insert(types, '{}')
    else
      table.insert(types, t)
    end
  end

  if #types == 1 then
    return types[1] .. (optional and '?' or '')
  else
    return table.concat(types, ' | ') .. (optional and ' | nil' or '')
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
    if ret.name:match('%.%.%.') then
      table.insert(t, '...' .. genType(ret))
    else
      table.insert(t, genType(ret))
    end
  end

  return table.concat(t, ', ')
end

genFunction = function(fn)
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
        write('    & (%s)%s\n', genFunction(variant), i == #fn.variants and ',' or '')
      end
    else
      write('  %s: %s,\n', fn.name, genFunction(fn.variants[1]))
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

    -- Superclasses need to be declared before their subclasses
    table.sort(module.objects, function(a, b)
      local abase = a.name == 'Joint' or a.name == 'Shape'
      local bbase = b.name == 'Joint' or b.name == 'Shape'
      if abase == bbase then
        return a.name < b.name
      else
        return abase
      end
    end)

    for _, object in ipairs(module.objects) do
      write('declare extern type %s', object.name)

      if object.extends then
        write(' extends %s', object.extends)
      end

      write(' with\n')

      for _, method in ipairs(object.methods) do
        for _, variant in ipairs(method.variants) do
          write('%s\n', genMethod(method, variant))
        end
      end

      write('end\n\n')
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
    if module.name ~= 'lovr' and #module.functions > 0 and not module.external then
      write('  %s: %sModule,\n', module.name, module.name:gsub('^%l', string.upper))
    end
  end

  write('}\n\n')

  write(vectors)

  local file = assert(io.open(directory .. '/lovr.d.luau', 'w'))
  file:write(table.concat(out))
  file:close()
end
