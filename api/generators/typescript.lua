-- done:
--
-- - callbacks
-- - module functions
-- - object methods
-- - rest parameters
-- - uses of the name 'default'
-- - uses of the name '*'
-- - uses of the type '*'
-- - rest returns
-- - interface inheritance
-- - arguments with defaults are optional
-- - vector operators
-- - vec3.up etc
-- - table arguments with specified fields
-- - fn variant documentation
-- - type and interface documentation
-- - show call example in documentation (e.g. `const [x, y, z] = collider.getPosition()`)
-- - fix callbacks being generated with a `this` parameter
--
-- todo:
--
-- - lovr.graphics.getDevice() more specific return value and documentation
--   (available in .table field of return value)
-- - global vector constructors documentation
-- - LuaTable specializations
-- - enet
-- - http
--
-- some recommended changes to lovr-docs i found while working on this:
--
-- - mark draw return value as optional somehow?
-- - make pass.setColor() explicitly accept vec3/vec4

local include_references = false -- generate @see `other` references in documentation

-- todo: the global constructors should be automated in order to include documentation
local vector_ops = [[
/** @noSelf **/ declare function vec2(x?: number, y?: number): Vec2
/** @noSelf **/ declare function vec2(u: Vec2): Vec2
/** @noSelf **/ declare function Vec2(x?: number, y?: number): Vec2
/** @noSelf **/ declare function Vec2(u: Vec2): Vec2

declare namespace vec2 {
  const zero: Vec2
  const one: Vec2
}

/** @noSelf **/ declare function vec3(x?: number, y?: number, z?: number): Vec3
/** @noSelf **/ declare function vec3(u: Vec3): Vec3
/** @noSelf **/ declare function vec3(m: Mat4): Vec3
/** @noSelf **/ declare function vec3(q: Quat): Vec3
/** @noSelf **/ declare function Vec3(x?: number, y?: number, z?: number): Vec3
/** @noSelf **/ declare function Vec3(u: Vec3): Vec3
/** @noSelf **/ declare function Vec3(m: Mat4): Vec3
/** @noSelf **/ declare function Vec3(q: Quat): Vec3

declare namespace vec3 {
  const zero: Vec3
  const one: Vec3
  const left: Vec3
  const right: Vec3
  const up: Vec3
  const down: Vec3
  const back: Vec3
  const forward: Vec3
}

/** @noSelf **/ declare function vec4(x?: number, y?: number, z?: number, w?: number): Vec4
/** @noSelf **/ declare function vec4(u: Vec4): Vec4
/** @noSelf **/ declare function Vec4(x?: number, y?: number, z?: number, w?: number): Vec4
/** @noSelf **/ declare function Vec4(u: Vec4): Vec4

declare namespace vec4 {
  const zero: Vec4
  const one: Vec4
}

/** @noSelf **/ declare function quat(angle?: number, ax?: number, ay?: number, az?: number, raw?: boolean): Quat
/** @noSelf **/ declare function quat(r: Quat): Quat
/** @noSelf **/ declare function quat(v: Vec3): Quat
/** @noSelf **/ declare function quat(v: Vec3, u: Vec3): Quat
/** @noSelf **/ declare function quat(m: Mat4): Quat
/** @noSelf **/ declare function quat(): Quat
/** @noSelf **/ declare function Quat(angle?: number, ax?: number, ay?: number, az?: number, raw?: boolean): Quat
/** @noSelf **/ declare function Quat(r: Quat): Quat
/** @noSelf **/ declare function Quat(v: Vec3): Quat
/** @noSelf **/ declare function Quat(v: Vec3, u: Vec3): Quat
/** @noSelf **/ declare function Quat(m: Mat4): Quat
/** @noSelf **/ declare function Quat(): Quat

declare namespace quat {
  const identity: Quat
}

/** @noSelf **/ declare function mat4(): Mat4
/** @noSelf **/ declare function mat4(n: Mat4): Mat4
/** @noSelf **/ declare function mat4(position?: Vec3, scale?: Vec3, rotation?: Quat): Mat4
/** @noSelf **/ declare function mat4(position?: Vec3, rotation?: Quat): Mat4
/** @noSelf **/ declare function mat4(...rest: number[]): Mat4
/** @noSelf **/ declare function mat4(d: number): Mat4
/** @noSelf **/ declare function Mat4(): Mat4
/** @noSelf **/ declare function Mat4(n: Mat4): Mat4
/** @noSelf **/ declare function Mat4(position?: Vec3, scale?: Vec3, rotation?: Quat): Mat4
/** @noSelf **/ declare function Mat4(position?: Vec3, rotation?: Quat): Mat4
/** @noSelf **/ declare function Mat4(...rest: number[]): Mat4
/** @noSelf **/ declare function Mat4(d: number): Mat4

declare interface Vec2 {
  add_temp: LuaAdditionMethod<Vec2, Vec2>
  sub_temp: LuaSubtractionMethod<Vec2, Vec2>
  mul_temp: LuaMultiplicationMethod<Vec2 | number, Vec2>
  div_temp: LuaDivisionMethod<Vec2 | number, Vec2>

  1: number
  2: number

  x: number
  y: number

  r: number
  g: number

  s: number
  t: number
}

declare interface Vec3 {
  add_temp: LuaAdditionMethod<Vec3, Vec3>
  sub_temp: LuaSubtractionMethod<Vec3, Vec3>
  mul_temp: LuaMultiplicationMethod<Vec3 | number, Vec3>
  div_temp: LuaDivisionMethod<Vec3 | number, Vec3>

  1: number
  2: number
  3: number

  x: number
  y: number
  z: number

  r: number
  g: number
  b: number

  s: number
  t: number
  p: number
}

declare interface Vec4 {
  add_temp: LuaAdditionMethod<Vec4, Vec4>
  sub_temp: LuaSubtractionMethod<Vec4, Vec4>
  mul_temp: LuaMultiplicationMethod<Vec4 | number, Vec4>
  div_temp: LuaDivisionMethod<Vec4 | number, Vec4>

  1: number
  2: number
  3: number
  4: number

  x: number
  y: number
  z: number
  w: number

  r: number
  g: number
  b: number
  a: number

  s: number
  t: number
  p: number
  q: number
}

declare interface Quat {
  add_temp: LuaAdditionMethod<Quat, Quat>
  sub_temp: LuaSubtractionMethod<Quat, Quat>
  mul_temp: LuaMultiplicationMethod<Quat, Quat> & LuaMultiplicationMethod<Vec3, Vec3>
  div_temp: LuaDivisionMethod<Quat, Quat>

  1: number
  2: number
  3: number
  4: number

  x: number
  y: number
  z: number
  w: number
}

declare interface Mat4 {
  add_temp: LuaAdditionMethod<Mat4, Mat4>
  sub_temp: LuaSubtractionMethod<Mat4, Mat4>
  mul_temp: LuaMultiplicationMethod<Mat4 | number, Mat4> & LuaMultiplicationMethod<Vec3, Vec3> & LuaMultiplicationMethod<Vec4, Vec4>
  div_temp: LuaDivisionMethod<Mat4 | number, Mat4>

  1: number
  2: number
  3: number
  4: number
  5: number
  6: number
  7: number
  8: number
  9: number
  10: number
  11: number
  12: number
  13: number
  14: number
  15: number
  16: number
}
]]

return function (api)
  local path = lovr.filesystem.getSource() .. '/typescript'

  if lovr.system.getOS() == 'Windows' then
    os.execute('mkdir ' .. path:gsub('/', '\\'))
  else
    os.execute('mkdir -p ' .. path)
  end

  local out = io.open(path .. '/lovr-api.d.ts', 'w')
  assert(out)

  local function put (...)
    out:write(...)
  end

  local indentation = ''

  local function indent()
    indentation = (' '):rep(#indentation + 2)
  end

  local function unindent()
    indentation = (' '):rep(#indentation - 2)
  end

  local function quote_string (str)
    return "'" .. str:gsub('\\', '\\\\'):gsub("'", "\\'") .. "'"
  end

  local function put_doc(doc)
    if doc:match('\n') then
      put(indentation, '/**\n',
        indentation, ' * ', doc:gsub('\n', '\n' .. indentation .. ' * '), '\n',
        indentation, ' */\n')
    else
      put(indentation, '/** ', doc, ' */\n')
    end
  end

  -- todo: more specific types
  local type_map = {
    table = 'LuaTable',
    userdata = 'any',
    lightuserdata = 'any',
    ['function'] = '(this: void, ...args: any[]) => any',
    ['*'] = 'any',
    ['Object'] = 'LovrObject',
    ['nil'] = 'undefined'
  }

  local convert_type

  local function convert_table (table_fields)
    local result = '{ '
    for i, field in ipairs (table_fields) do
      local optional = field.default and '?' or ''
      result = result .. field.name .. optional .. ': ' .. convert_type(field.type, field.table)
      if i < #table_fields then
        result = result .. ', '
      end
    end
    return result .. '}'
  end

  local function make_array_type(t)
    if t:match '|' then
      t = '(' .. t .. ')'
    end
    return t .. '[]'
  end

  local function convert_individual_type (t, table_fields)
    if t == 'table' and table_fields then
      return convert_table (table_fields)
    else
      return type_map[t] or t
    end
  end

  function convert_type(t, table_fields)
    t = t:match('^%s*(.-)%s*$')
    local array_pattern = '^{(.*)}$'
    if t:match(array_pattern) then
      local inner = t:match(array_pattern)
      local converted = convert_type(inner)
      return make_array_type(converted)
    elseif t:match('|') then
      local result
      for subtype in t:gmatch('[^|]+') do
        result = result and (result .. ' | ') or ''
        result = result .. convert_type(subtype)
      end
      return result
    else
      return convert_individual_type(t, table_fields)
    end
  end

  local name_map = {
    ['*'] = 'rest',
  }

  local function convert_name (n)
    return name_map[n] or n
  end

  local function convert_param (arg, optional)
    local name = convert_name(arg.name)
    local t = convert_type(arg.type, arg.table)
    local pattern = '%.%.%.'
    if name:match(pattern) then
      name = '...' .. name:gsub(pattern, '')
      if name == '...' then
        name = name .. 'rest'
      end
      t = make_array_type(t)
    end
    return name .. (optional and '?' or '') .. ': ' .. t
  end

  local function convert_return_values (returns)
    local ret = 'void'
    if #returns == 1 and (not returns[1].name:match('%.%.%.')) then
      ret = convert_type(returns[1].type)
    elseif #returns >= 1 then
      ret = 'LuaMultiReturn<['
      for n, ret_n in ipairs (returns) do
        local name = convert_name(ret_n.name)
        local t = convert_type(ret_n.type)
        if name:match('%.%.%.') then
          if name == '...' then
            name = '...rest'
          end
          t = make_array_type(t)
        end
        ret = ret .. name .. ': ' .. t
        if n < #returns then
          ret = ret .. ', '
        end
      end
      ret = ret .. ']>'
    end
    return ret
  end

  local function put_fn_variant (fn, variant, is_interface)
    -- docs
    local doc = fn.description
    -- show call example
    doc = doc .. '\n\n`'
    if #variant.returns > 0 then
      if #variant.returns > 1 then
        doc = doc .. '['
      end
      for i, ret in ipairs (variant.returns) do
        doc = doc .. ret.name
        if i < #variant.returns then
          doc = doc .. ', '
        end
      end
      if #variant.returns > 1 then
        doc = doc .. ']'
      end
      doc = doc .. ' = '
    end
    doc = doc .. fn.key:gsub(':', '.')
    doc = doc .. '('
    for i, arg in ipairs (variant.arguments) do
      doc = doc .. arg.name
      if i < #variant.arguments then
        doc = doc .. ', '
      end
    end
    doc = doc .. ')'
    doc = doc .. '`'
    if variant.description then
      doc = doc .. '\n\n' .. variant.description
    end
    -- @params and @returns
    if #variant.arguments > 0 or #variant.returns > 0 then
      doc = doc .. '\n'
      if #variant.arguments > 0 then
        for _, arg in ipairs(variant.arguments) do
          doc = doc .. '\n@param ' .. arg.name .. ' - ' .. arg.description
        end
      end
      if #variant.returns > 0 then
        doc = doc .. '\n@returns '
        -- todo handle .table field in return value (for lovr.graphics.getDevice() it's there instead of description)
        if #variant.returns == 1 then
          doc = doc .. (variant.returns[1].description or '')
        else
          for _, ret in ipairs(variant.returns) do
            doc = doc .. '\n' .. ret.name .. ' - ' .. (ret.description or '')
          end
        end
      end
    end

    if fn.notes then
      doc = doc .. '\n\n' .. fn.notes
    end

    if include_references and fn.related then
      doc = doc .. '\n'
      for _, rel in ipairs(fn.related) do
        doc = doc .. '\n@see {@link ' .. rel:gsub(':', '.') .. '}'
      end
    end

    put_doc(doc)

    -- type
    put(indentation)

    if not is_interface then
      put('function ')
    end
    put(convert_name(fn.name))
    put('(')
    local last_required = 0
    for arg_index, arg in ipairs (variant.arguments) do
      if not arg.default then
        last_required = arg_index
      end
    end
    for arg_index, arg in ipairs (variant.arguments) do
      put(convert_param(arg, arg_index > last_required))
      if arg_index < #variant.arguments then
        put(', ')
      end
    end
    put('): ')
    put(convert_return_values(variant.returns))
    put('\n\n')
  end

  put ('/** @noSelf **/\n')
  put ('declare namespace lovr {\n')
  indent()

  -- callbacks
  for _, callback in ipairs (api.callbacks) do
    for _, variant in ipairs(callback.variants) do
      put_fn_variant (callback, variant)
    end
  end
  put('\n')

  -- module functions
  for module_index, module in ipairs(api.modules) do
    put (indentation, 'namespace ', module.name, ' {\n')
    indent()
    for _, fn in ipairs(module.functions) do
      for _, variant in ipairs (fn.variants) do
        put_fn_variant (fn, variant)
      end
    end
    unindent()
    put (indentation, '}\n')
    if module_index < #api.modules then
      put('\n')
    end
  end

  unindent()
  put ('}\n\n')

  -- module types
  for _, module in ipairs(api.modules) do
    for _, enum in ipairs(module.enums) do
      -- doc
      local doc = enum.description
      if enum.notes then
         doc = doc .. '\n\n' .. enum.notes
      end
      if include_references and enum.related then
        doc = doc .. '\n'
        for _, rel in ipairs(enum.related) do
          doc = doc .. '\n@see {@link ' .. rel:gsub(':', '.') .. '}'
        end
      end
      put_doc(doc)

      -- type
      put('declare type ', enum.name, ' = ')
      for value_index, value in ipairs(enum.values) do
        put(quote_string(value.name))
        if value_index < #enum.values then
          put(' | ')
        end
      end
      put('\n\n')
    end
    for _, object in ipairs(module.objects) do
      -- doc
      local doc = object.description
      if object.notes then
         doc = doc .. '\n\n' .. object.notes
      end
      if include_references and object.related then
        doc = doc .. '\n'
        for _, rel in ipairs(object.related) do
          doc = doc .. '\n@see {@link ' .. rel:gsub(':', '.') .. '}'
        end
      end
      put_doc(doc)

      -- interface
      local extends = object.extends and (' extends ' .. convert_type(object.extends)) or ''
      put ('declare interface ', convert_type(object.name), extends, ' {\n')
      indent()
      for _, method in ipairs (object.methods) do
        for _, variant in ipairs (method.variants) do
          put_fn_variant (method, variant, true)
        end
      end
      unindent()
      put ('}\n\n')
    end
  end

  put(vector_ops)

  out:close()
end
