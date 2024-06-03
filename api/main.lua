local serpent = require 'serpent'

local f = io.popen('git branch --show-current')
local dev = f and f:read('*a'):match('%w+') == 'dev'
f:close()

-- Helpers

local function copy(t)
  if type(t) ~= 'table' then return t end
  local result = {}
  for k, v in pairs(t) do
    result[k] = copy(v)
  end
  return result
end

local function unindent(code)
  local indent = code:match('^(% +)')
  if indent then
    return code:gsub('\n' .. indent, '\n'):gsub('^' .. indent, ''):gsub('%s*$', '')
  else
    return code
  end
end

local function unwrap(str)
  if not str then return str end
  str = unindent(str)
  return str:gsub('([^\n])\n(%S)', function(a, b)
    if b == '-' or b == '>' then
      return a .. '\n' .. b
    else
      return a .. ' ' .. b
    end
  end)
    :gsub('^%s+', '')
    :gsub('%s+$', '')
end

local function pluralify(t, key)
  t[key .. 's'] = t[key .. 's'] or (t[key] and { t[key] } or nil)
  t[key] = nil
  return t[key .. 's']
end

local lookup = {}
local function track(obj)
  lookup[obj.key] = obj
end

local function warn(s, ...)
  print(string.format(s, ...))
end

local function warnIf(cond, ...)
  if cond then warn(...) end
end

-- Processors
local function processExample(example, key)
  if type(example) == 'string' then
    return {
      code = unindent(example)
    }
  else
    assert(example.code, string.format('%s example is missing code', key))
    example.description = unwrap(example.description)
    example.code = unindent(example.code)
  end

  return example
end

local function processEnum(path, parent)
  local enum = require(path)

  enum.name = path:match('[^/]+$')
  enum.key = enum.name
  enum.module = parent.key
  enum.description = unwrap(enum.description)
  enum.notes = unwrap(enum.notes)

  for _, value in ipairs(enum.values) do
    value.description = unwrap(value.description)
  end

  track(enum)
  return enum
end

local function processFunction(path, parent)
  local fn = require(path)

  fn.name = path:match('[^/]+$')
  fn.key = parent.name:match('^[A-Z]') and (parent.key .. ':' .. fn.name) or (path:gsub('/', '.'):gsub('callbacks%.', ''))
  fn.description = unwrap(fn.description)
  fn.module = parent.module or parent.key
  fn.notes = unwrap(fn.notes)
  fn.examples = pluralify(fn, 'example')

  for k, example in ipairs(fn.examples or {}) do
    fn.examples[k] = processExample(example, fn.key)
  end

  assert(fn.variants, string.format('Function %q is missing variants', fn.key))
  assert(fn.arguments, string.format('Function %q does not have arguments list', fn.key))
  assert(fn.returns, string.format('Function %q does not have returns list', fn.key))

  for name, arg in pairs(fn.arguments) do
    arg.name = name
  end

  for name, ret in pairs(fn.returns) do
    ret.name = name
  end

  for i, variant in ipairs(fn.variants) do
    assert(variant.arguments, string.format('%q variant #%d is missing arguments', fn.key, i))
    assert(variant.returns, string.format('%q variant #%d is missing returns', fn.key, i))

    for j, name in ipairs(variant.arguments) do
      warnIf(not fn.arguments[name], string.format('%s uses unknown argument %s', fn.key, name))
      variant.arguments[j] = copy(fn.arguments[name])
    end

    for j, name in ipairs(variant.returns) do
      warnIf(not fn.returns[name], string.format('%s uses unknown return %s', fn.key, name))
      variant.returns[j] = copy(fn.returns[name])
    end
  end

  for _, variant in ipairs(fn.variants) do
    local function processTable(t)
      if not t then return end

      for _, field in ipairs(t) do
        field.description = unwrap(field.description)
        processTable(field.table)
      end

      t.description = unwrap(t.description)
    end

    variant.description = unwrap(variant.description)

    for _, arg in ipairs(variant.arguments) do
      arg.description = unwrap(arg.description)
      processTable(arg.table)
    end

    for _, ret in ipairs(variant.returns) do
      ret.description = unwrap(ret.description)
      processTable(ret.table)
    end
  end

  fn.arguments = nil
  fn.returns = nil

  track(fn)
  return fn
end

local function processObject(path, parent)
  local object = require(path .. '.init')
  assert(type(object) == 'table', string.format('%s/init.lua did not return a table', path))

  object.key = path:match('[^/]+$')
  object.name = object.key
  object.description = unwrap(object.description)
  object.summary = object.summary or object.description
  object.module = parent.key
  object.constructors = pluralify(object, 'constructor')
  object.notes = unwrap(object.notes)
  object.examples = pluralify(object, 'example')

  if object.sections then
    for _, section in ipairs(object.sections) do
      section.description = unwrap(section.description)
    end
  end

  local methods = {}

  for _, file in ipairs(lovr.filesystem.getDirectoryItems(path)) do
    if file ~= 'init.lua' then
      local method = file:gsub('%..+$', '')
      local key = ('%s:%s'):format(object.name, method)
      methods[key] = processFunction(path .. '/' .. method, object)
    end
  end

  if object.methods then
    for i, key in ipairs(object.methods) do
      object.methods[i] = methods[key]
      warnIf(not methods[key], '%s links to unknown method %q', object.key, key)
      methods[key] = nil
    end

    for method in pairs(methods) do
      warn('%s is missing link to %q', object.key, method)
    end
  else
    object.methods = {}

    for key, method in pairs(methods) do
      table.insert(object.methods, method)
    end

    table.sort(object.methods, function(a, b) return a.key < b.key end)
  end

  for k, example in ipairs(object.examples or {}) do
    object.examples[k] = processExample(example, object.key)
  end

  track(object)
  return object
end

local function processModule(path)
  local module = require(path .. '.init') -- So we avoid requiring the module itself

  module.key = module.external and path:match('[^/]+$') or path:gsub('/', '.')
  module.name = module.external and module.key or module.key:match('[^%.]+$')
  module.description = unwrap(module.description)
  module.functions = {}
  module.objects = {}
  module.enums = {}
  module.notes = unwrap(module.notes)

  if module.sections then
    for _, section in ipairs(module.sections) do
      section.description = unwrap(section.description)
    end
  end

  module.examples = pluralify(module, 'example')
  for k, example in ipairs(module.examples or {}) do
    module.examples[k] = processExample(example, module.key)
  end

  for _, file in ipairs(lovr.filesystem.getDirectoryItems(path)) do
    local childPath = path .. '/' .. file
    local childModule = childPath:gsub('%..+$', '')
    local isFile = lovr.filesystem.isFile(childPath)
    local capitalized = file:match('^[A-Z]')

    if file ~= 'init.lua' and not capitalized and isFile then
      table.insert(module.functions, processFunction(childModule, module))
    elseif capitalized and not isFile then
      table.insert(module.objects, processObject(childModule, module))
    elseif capitalized and isFile then
      table.insert(module.enums, processEnum(childModule, module))
    end
  end

  table.sort(module.functions, function(a, b) return a.key < b.key end)
  table.sort(module.objects, function(a, b) return a.key < b.key end)
  table.sort(module.enums, function(a, b) return a.key < b.key end)

  track(module)
  return module
end

-- Validation
local function validateRelated(item)
  for _, key in ipairs(item.related or {}) do
    warnIf(not lookup[key], '%s has unknown related item %s', item.key, key)
    warnIf(key == item.key, '%s should not be related to itself', key)
  end
end

local function validateEnum(enum)
  for i, value in ipairs(enum.values) do
    warnIf(not value.name, 'Enum %s value #%d is missing name', enum.name, i)
    warnIf(not value.description, 'Enum %s value #%d is missing description', enum.name, i)
  end

  validateRelated(enum)
end

local function validateFunction(fn)
  if fn.tag then
    local found = false
    for _, section in ipairs(lookup[fn.module].sections or {}) do
      if section.tag == fn.tag then found = true break end
    end
    for _, object in ipairs(lookup[fn.module].objects) do
      for _, section in ipairs(object.sections or {}) do
        if section.tag == fn.tag then found = true break end
      end
    end
    warnIf(not found, 'Unknown tag %s for %s', fn.tag, fn.key)
  end

  for _, variant in ipairs(fn.variants) do
    for _, arg in ipairs(variant.arguments) do
      warnIf(not arg or not arg.name, 'Invalid argument for variant of %s', fn.key)
      warnIf(not arg.type or (arg.type:match('^[A-Z]') and not lookup[arg.type]), 'Invalid or missing argument type in %s', fn.key)
    end

    for _, ret in ipairs(variant.returns) do
      warnIf(not ret or not ret.name, 'Invalid return for variant of %s', fn.key)
      warnIf(not ret.type or (ret.type:match('^[A-Z]') and not lookup[ret.type]), 'Invalid or missing return type in %s', fn.key)
    end
  end

  validateRelated(fn)
end

local function validateObject(object)
  for _, constructor in ipairs(object.constructors or {}) do
    warnIf(not lookup[constructor], 'Constructor for %s not found: %s', object.key, constructor)
  end

  for _, method in ipairs(object.methods or {}) do
    validateFunction(method)
  end

  local metatable = debug.getregistry()[object.name]

  if dev and metatable then
    local hasMethod = {}

    for _, method in ipairs(object.methods or {}) do
      warnIf(not metatable[method.name], '%s has docs for unknown method %s', object.name, method.name)
      hasMethod[method.name] = true
    end

    if object.extends then
      for i, method in ipairs(lookup[object.extends].methods) do
        hasMethod[method.name] = true
      end
    end

    local ignore = {
      type = true,
      release = true,
      monkey = true
    }

    for name in pairs(metatable) do
      if not name:match('^__') and not ignore[name] then
        warnIf(not hasMethod[name], '%s is missing docs for %s', object.name, name)
      end
    end
  end

  validateRelated(object)
end

local function validateModule(module)
  local t = lovr[module.name]

  for _, object in ipairs(module.objects) do
    validateObject(object)
  end

  for _, fn in ipairs(module.functions) do
    validateFunction(fn)
    if dev and not fn.deprecated then
      warnIf(t and not t[fn.name], '%s has docs for unknown function %s', module.key, fn.name)
    end
  end

  for _, fn in ipairs(module.enums) do
    validateEnum(fn)
  end
end

function lovr.load()
  local api = {
    modules = {},
    callbacks = {}
  }

  -- So errhand exits
  lovr.graphics = nil

  -- Modules
  table.insert(api.modules, processModule('lovr'))

  for _, file in ipairs(lovr.filesystem.getDirectoryItems('lovr')) do
    local path = 'lovr/' .. file

    if file ~= 'callbacks' and file:match('^[a-z]') and lovr.filesystem.isDirectory(path) then
      table.insert(api.modules, processModule(path))
    end
  end

  -- Callbacks
  local callbacks = 'lovr/callbacks'
  for _, file in ipairs(lovr.filesystem.getDirectoryItems(callbacks)) do
    table.insert(api.callbacks, processFunction(callbacks .. '/' .. file:gsub('%.lua', ''), api.modules[1]))
  end

  -- Validate
  for _, callback in ipairs(api.callbacks) do
    validateFunction(callback)
  end

  for _, module in ipairs(api.modules) do
    validateModule(module)
  end

  -- Sort
  table.sort(api.modules, function(a, b) return a.key < b.key end)
  table.sort(api.callbacks, function(a, b) return a.key < b.key end)

  -- Serialize
  local file = io.open(lovr.filesystem.getSource() .. '/init.lua', 'w')
  assert(file, 'Could not open init.lua for writing')

  local keyPriority = {
    name = 1,
    tag = 2,
    summary = 3,
    type = 4,
    description = 5,
    key = 6,
    module = 7,
    arguments = 8,
    returns = 9
  }
  local function sort(keys, t)
    table.sort(keys, function(lhs, rhs)
      local leftPrio = keyPriority[lhs]
      local rightPrio = keyPriority[rhs]
      if leftPrio and rightPrio then
        return leftPrio < rightPrio
      elseif leftPrio or rightPrio then
        return leftPrio ~= nil
      else
        return lhs < rhs
      end
    end)
  end
  local contents = 'return ' .. serpent.block(api, { comment = false, sortkeys = sort })
  file:write(contents)
  file:close()

  -- Bye
  lovr.event.quit()
end
