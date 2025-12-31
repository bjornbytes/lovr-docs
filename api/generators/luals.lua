local root = lovr.filesystem.getSource()

local OUTPUT = root .. '/luals/'
local API_OUTPUT = OUTPUT .. 'library/'
local DOCS_URL = 'https://lovr.org/docs/'

local OPERATOR_LOOKUP = {
  ['add'] = 'add',
  ['sub'] = 'sub',
  ['div'] = 'div',
  ['mul'] = 'mul',
  --['equals'] = 'eq',
  --['length'] = 'len',
}

--- Breaks a multi-line string (such as a description) into a bunch of commented
--- lines, takes care of code blocks, input should be valid markdown.
--- CONSIDER: Maybe break them even further at periods? Not sure.
local function writeComment(cmt, f)
  cmt = cmt:gsub('^%s*(.-)%s*$', '%1') -- Remove newlines at the beginning and end

  local code_mode
  for line in cmt:gmatch('[^\r\n]+') do
    -- WORKAROUND: LuaLS should be able to turn these into code blocks on its own,
    --       sadly, LuaLS is stupid! so we got to do this manually.

    -- Ignore empty lines
    if not line:match('%S') then
      local indented = line:sub(1, 1) == ' '
      if indented ~= code_mode then
        f:write('--- ```lua\n')
      end
      code_mode = indented
    end

    f:write('--- ')
    f:write(line)
    f:write('\n')
  end
end

--- Turns a multiline string into a single line string.
local function writeSingleLine(cmt, f)
  f:write((cmt:gsub('\n', '')))
end

--- Writes information related to an Object, Function, Enum, etc.
--- such as description, notes, examples, documentation links, and related things.
local function writeInfo(data, f)
  if data.description then
    writeComment(data.description, f)
  end

  if data.notes then
    f:write('---\n')
    f:write('--- ## NOTES:\n')
    writeComment(data.notes, f)
  end

  if data.examples then
    f:write('---\n')
    f:write('--- ## EXAMPLES:\n')
    for i, example in ipairs(data.examples) do
      f:write('--- ### ')
      f:write(i)
      f:write('.\n')

      if example.description then
        writeComment(example.description, f)
      end

      if example.code then
        f:write('--- ```lua\n')
        writeComment(example.code, f)
        f:write('--- ```\n')
      end
    end
  end

  if data.key then
    f:write('---\n')
    f:write('--- [Open in browser](')
    f:write(DOCS_URL)
    f:write(data.key)
    f:write(')\n')
  end

  if data.related then
    f:write('---\n')
    for _, rel in ipairs(data.related) do
      f:write('---@see ')
      f:write((rel:gsub(':', '.')))
      f:write('\n')
    end
  end
end

--- Generates an '@alias' directive for fake enums.
local function writeEnum(enum, f)
  -- We don't write full info here, because, sadly, LuaLS will ignore it.
  writeComment(enum.description, f)

  --# ---@alias MyEnum
  f:write('---@alias ')
  f:write(enum.name)
  f:write('\n')

  --# --| 'Cool' # Denotes a particular coolness.
  for _, value in ipairs(enum.values) do
    f:write('---| \'')
    f:write(value.name)
    f:write('\' # ')
    writeSingleLine(value.description, f)
    f:write('\n')
  end

  f:write('\n')
end

-- Utility for translating from the pseudo-syntax used for types in Lövr's API
-- to the syntax used for LuaLS annotations.
local function handleType(t, tab)
  if tab then
    local entries = {}

    local arrayable = {}
    for _, e in ipairs(tab) do
      local from_array = e.name:sub(1, 2) == '[]'
      local has_dot = e.name:sub(3, 3) == '.'

      -- {[].name: type} -> {[number]: {name: type}}
      -- {[][1].name: type} -> {[number]: {[1]: {name: type}}}
      if from_array then
        e.name = e.name:sub(has_dot and 4 or 3)
        table.insert(arrayable, e)
      else -- {name: type} -> {name: type}
        local opt = e.default and '?' or ''
        local n = e.name .. ': ' .. handleType(e.type, e.table) .. opt
        table.insert(entries, n)
      end
    end

    if #arrayable > 0 then
      table.insert(entries,
        '[number]: ' .. handleType(nil, arrayable)
      )
    end

    return '{' .. table.concat(entries, ', ') .. '}'
  end

  if t == '*' then -- * -> any
    return 'any'
  end

  local a = t:match('{(.*)}') -- {type} -> type[]
  if a then
    return handleType(a) .. '[]'
  end

  if t:find('|') then -- {A | B} -> (A | B)
    local things = {}
    for item in t:gmatch('[^|]+') do
      -- trim whitespace around each item
      item = item:match('^%s*(.-)%s*$')
      table.insert(things, handleType(item))
    end

    return '(' .. table.concat(things, ' | ') .. ')'
  end

  -- A -> A
  return t
end

-- Assumes that an object with :sub, also has :__sub, for example
local function writeOperator(func, f)
  local name = OPERATOR_LOOKUP[func.name]
  if not name then
    return
  end

  for i = 1, #func.variants do
    local var = func.variants[i]

    if (#var.arguments > 1) then
      goto continue
    end

    local params = {}
    for _, arg in ipairs(var.arguments) do
      table.insert(params, handleType(arg.type, arg.table))
    end

    if (#var.returns > 1) then
      goto continue
    end

    local returns = {}
    for _, ret in ipairs(var.returns) do
      table.insert(returns, handleType(ret.type, ret.table))
    end

    --# ---@operator add(Vec2): Vec2
    f:write('---@operator ')
    f:write(name)
    f:write('(')
    f:write(table.concat(params, ', '))
    f:write(')')
    if #returns > 0 then
      f:write(': ')
      f:write(table.concat(returns, ', '))
    end
    f:write('\n')

    ::continue::
  end
end

local function handleParam(name)
  if name:sub(1, 3) == '...' then -- ...something -> ...
    return '...'
  end
  return name -- a -> a
end

--- Writes a function definition with all of its possible variants as
--- overloads.
local function writeFunction(func, namespace, is_method, f)
  local name = func.name

  writeInfo(func, f)

  local params = {}
  local first = func.variants[1]
  do
    for _, arg in ipairs(first.arguments) do
      local param = handleParam(arg.name)
      local type = handleType(arg.type, arg.table) .. (arg.default and '?' or '')

      f:write('---@param ')
      f:write(param)
      f:write(' ')
      f:write(type)
      f:write(' # ')
      writeSingleLine(arg.description, f)
      if arg.default then
        f:write(' (default: ')
        f:write(arg.default)
        f:write(')')
      end
      f:write('\n')
      table.insert(params, param)
    end

    for _, ret in ipairs(first.returns) do
      f:write('---@return ')
      f:write(handleType(ret.type, ret.table))
      if ret.description then
        f:write(' # ')
        writeSingleLine(ret.description, f)
      end
      f:write('\n')
    end
  end

  for i = 2, #func.variants do
    local var = func.variants[i]

    local p = {}
    -- Apparently overloads don't include 'self' by default.
    if is_method then
      table.insert(p, 'self: ' .. namespace)
    end

    for _, arg in ipairs(var.arguments) do
      local param = handleParam(arg.name)
      if arg.default then
        param = param .. '?'
      end
      table.insert(p, param .. ': ' .. handleType(arg.type, arg.table))
    end

    local returns = {}
    for _, ret in ipairs(var.returns) do
      table.insert(returns, handleType(ret.type, ret.table))
    end

    f:write('---@overload fun(')
    f:write(table.concat(p, ', '))
    f:write(')')
    if #returns > 0 then
      f:write(': ')
      f:write(table.concat(returns, ', '))
    end
    f:write('\n')
  end

  f:write('function ')
  f:write(namespace)
  f:write(is_method and ':' or '.')
  f:write(name)
  f:write('(')
  f:write(table.concat(params, ', '))
  f:write(') end')

  f:write('\n\n')
end

--- Writes an object type by treating it like a @class, handles vector and matrix types.
--- Only does x/y/z/w. No swizzles, no r/g/b/a.
local function writeObject(object, f)
  local name = object.name

  -- We remove the related field because it is not supported for classes :(
  object.related = nil
  writeInfo(object, f)

  --# ---@class Blob
  f:write('---@class ')
  f:write(name)
  if name == 'Mat4' then
    f:write(': number[]')
  elseif name ~= 'Object' then
    f:write(': Object')
  end
  f:write('\n')

  local vec_n = tonumber(name:sub(4))
  if vec_n and name:sub(1, 3) == 'Vec' then
    local c = 'xyzw'
    for i = 1, vec_n do
      f:write('---@field ')
      f:write(c:sub(i, i))
      f:write(' number\n')
    end
  end

  for _, func in ipairs(object.methods) do
    writeOperator(func, f)
  end

  --# local Blob = {}
  f:write('local ')
  f:write(name)
  f:write(' = {}\n\n')

  for _, func in ipairs(object.methods) do
    writeFunction(func, name, true, f)
  end

  return name
end

local function processModule(module, callbacks)
  local key = module.key
  local name = module.name
  local is_main_module = key == 'lovr'

  io.write(('- %-20s'):format(key .. '...'))

  -- We skip external modules as they do not have any meaningful annotations.
  -- Plus, they often have their own, separately mantained annotations instead.
  if module.external then
    print('SKIP')
    return
  end

  local f = io.open(API_OUTPUT .. name .. '.lua', 'w+')
  assert(f, 'Could not open file, make sure you got permissions!')

  --# ---@meta lovr.audio
  f:write('---@meta ')
  f:write(key)
  f:write('\n\n')

  writeInfo(module, f)

  --# ---@class lovr.audio
  f:write('---@class ')
  f:write(key)
  f:write(is_main_module and ':table\n' or '\n')

  if is_main_module then
    --# ---@field draw draw_callback
    for _, call in ipairs(callbacks) do
      f:write('---@field ')
      f:write(call.name)
      f:write(' ')
      f:write(call.name)
      f:write('_callback\n')
    end
  end

  --# lovr.audio = {}
  f:write(key)
  f:write(' = {}\n\n')

  for _, enum in ipairs(module.enums) do
    writeEnum(enum, f)
  end

  for _, objt in ipairs(module.objects) do
    writeObject(objt, f)
  end

  for _, func in ipairs(module.functions) do
    writeFunction(func, key, false, f)
  end

  --# return lovr.audio
  f:write('return ')
  f:write(key)

  f:close()

  print('OK')
end

return function(api)
  -- Make sure the output folders exist.
  if lovr.system.getOS() == 'Windows' then
    os.execute('mkdir ' .. API_OUTPUT:gsub('/', '\\'))
  else
    os.execute('mkdir -p ' .. API_OUTPUT)
  end

  print('Processing modules')
  for _, module in ipairs(api.modules) do
    processModule(module, api.callbacks)
  end

  -- Write our callback types
  do
    local f = assert(io.open(API_OUTPUT .. 'callbacks.lua', 'w+'))

    f:write('---@meta\n\n')

    for _, call in ipairs(api.callbacks) do
      local name = call.name
      local var = call.variants[1]

      local p = {}
      for _, arg in ipairs(var.arguments) do
        local param = handleParam(arg.name)
        if arg.default then
          param = param .. '?'
        end
        table.insert(p, param .. ': ' .. handleType(arg.type, arg.table))
      end

      local returns = {}
      for _, ret in ipairs(var.returns) do
        table.insert(returns, handleType(ret.type, ret.table))
      end

      writeInfo(call, f)

      --# ---@alias draw_callback fun(pass: Pass)
      f:write('---@alias ')
      f:write(name)
      f:write('_callback')
      f:write(' fun(')
      f:write(table.concat(p, ', '))
      f:write(')')
      if #returns > 0 then
        f:write(': ')
        f:write(table.concat(returns, ', '))
      end
      f:write('\n\n')
    end

    f:close()
  end

  -- Write our globals
  do
    local f = assert(io.open(API_OUTPUT .. 'globals.lua', 'w+'))

    f:write('---@meta\n\n')
    f:write('vec2 = lovr.math.vec2\n')
    f:write('Vec2 = lovr.math.newVec2\n')
    f:write('vec3 = lovr.math.vec3\n')
    f:write('Vec3 = lovr.math.newVec3\n')
    f:write('vec4 = lovr.math.vec4\n')
    f:write('Vec4 = lovr.math.newVec4\n')
    f:write('mat4 = lovr.math.mat4\n')
    f:write('Mat4 = lovr.math.newMat4\n')
    f:write('quat = lovr.math.quat\n')
    f:write('Quat = lovr.math.newQuat\n')

    f:close()
  end

  -- Write our manifest :)
  do
    local f = assert(io.open(OUTPUT .. 'config.json', 'w+'))

    f:write('{\n')
    f:write('  "name": "LÖVR",\n')
    f:write('  "words": ["lovr%.%w+"],\n')
    f:write('  "settings": {\n')
    f:write('    "Lua.runtime.version" : "LuaJIT"\n')
    f:write('  }\n')
    f:write('}\n')
    f:close()

    print('Manifest written successfully.')
  end
end
