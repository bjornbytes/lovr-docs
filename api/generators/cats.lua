-- We're disabling `@see` tags for the time being because they
-- ended up confusing the language server a little, breaking
-- all objects from `lovr.math.*`.
local ENABLE_SEE_TAGS = false

-- Whether to generate an extra file with the globals
-- from the `lovr.math` module.
local INCLUDE_GLOBALS = true

local root = lovr.filesystem.getSource()

local function getPath(filename, sep)
  sep = sep or "/"
  return filename:match("(.*" .. sep .. ")")
end

--- Writes `contents` into a file identified by `filename`.
local function writeFile(filename, contents)
  local fullpath = ('%s/cats/%s'):format(root, filename)

  local file = io.open(fullpath, "w")
  if not file then
    print("Failed to open file for writing: " .. fullpath)
    return
  end

  file:write(contents)
  file:write("\n")
  file:close()
end

--- Adds a single value to a table.
local function add(t, v)
  t[#t + 1] = v
end

-- Shorthand to concatenate a table of strings with a delimiter.
local function join(t, delimiter)
  return table.concat(t, delimiter)
end

-- Shorthand to map a table with a function.
local function map(t, fn)
  local out = {}
  for i, v in ipairs(t) do
    out[i] = fn(v)
  end
  return out
end

--- Returns true if any element in the table `t` satisfies the predicate `fn`.
local function any(t, fn)
  for _, v in ipairs(t) do
    if fn(v) then
      return true
    end
  end
  return false
end

--- Renders the given string as a docstring. If the string
--- contains newlines, they are prefixed with `---`.
local function doc(str)
  str = str or ""
  return "---" .. str:gsub("\n", "\n---"):gsub('%s*$', '')
end

--- Determines if a parameter is optional. If it is, returns a `?` suffix.
--- If it's not, returns an empty string.
local function optionalSuffix(param)
  if param.type ~= 'table' then
    return (param.default ~= nil) and '?' or ''
  elseif not param.table then
    return ''
  elseif any(param.table, function(field) return field.default == nil end) then
    return ''
  else
    return '?'
  end
end

local function docHeader(str)
  return doc("#### " .. str .. "\n")
end

--- Render `@see` tags for a definition.
local function seeTags(out, def)
  if not ENABLE_SEE_TAGS then
    return
  end

  if def.related then
    for _, related in ipairs(def.related) do
      add(out, doc("@see " .. related))
    end
  end
end

-- Forward declaration for `argumentType`.
local argumentType

--- Returns the type of a table argument.
local function tableType(arg)
  local out = {}

  for _, field in ipairs(arg.table) do
    add(out, ("%s: %s"):format(field.name, argumentType(field)))
  end

  return ("{%s}"):format(join(out, ", "))
end

--- Returns the type of a function argument.
function argumentType(arg)
  if arg.type == "*" then
    return "any"
  elseif arg.type == 'table' and arg.table then
    return tableType(arg)
  else
    return arg.type
  end
end

--- Returns the name of a function argument.
function argumentName(arg)
  if arg.name:sub(1, 3) == '...' then
    return '...'
  else
    return arg.name
  end
end

--- Renders the header (description, notes, examples, etc.) for anything that's like a function.
local function renderFunctionHeader(out, func)
  add(out, "")
  add(out, doc(func.description))

  if (func.notes) then
    add(out, doc(""))
    add(out, docHeader("Notes:"))
    add(out, doc(func.notes))
  end

  if (func.examples) then
    for _, example in ipairs(func.examples) do
      add(out, doc(""))
      add(out, docHeader("Example:"))

      if example.description then
        add(out, doc(example.description))
        add(out, doc(""))
      end

      if example.code then
        add(out, doc("```lua"))
        add(out, doc(example.code))
        add(out, doc("```"))
      end
    end
  end

  add(out, doc(""))

  seeTags(out, func)
end

local function renderType(out, tag, variant)
  local returns
  if #variant.returns > 0 then
    returns = join(map(variant.returns, function(ret)
      return ret.type
    end), ", ")
  else
    returns = "nil"
  end

  local params = join(map(variant.arguments, function(arg)
    return ("%s%s: %s"):format(argumentName(arg), optionalSuffix(arg), argumentType(arg))
  end), ", ")

  add(out, doc(("%s fun(%s): %s"):format(tag, params, returns)))
end

local function renderFunctionVariant(out, func, variant)
  renderFunctionHeader(out, func)

  -- Document parameters
  if variant.arguments then
    for _, arg in ipairs(variant.arguments) do
      add(out, doc(("@param %s%s %s %s"):format(argumentName(arg), optionalSuffix(arg), argumentType(arg), arg.description)))
    end
  end

  -- Document return type
  if variant.returns then
    for _, ret in ipairs(variant.returns) do
      add(out, doc(("@return %s %s %s"):format(ret.type, ret.name, ret.description)))
    end
  end

  -- Build function signature
  local signature = join(map(variant.arguments, function(arg)
    return argumentName(arg)
  end), ", ")

  add(out, ("function %s(%s) end"):format(func.key, signature))
end

local function renderFunction(out, func)
  for _, variant in ipairs(func.variants) do
    renderFunctionVariant(out, func, variant)
  end
end

local function renderEnum(out, enum)
  add(out, "")
  add(out, doc(enum.description))
  add(out, doc("@alias " .. enum.key))
  for _, value in ipairs(enum.values) do
    add(out, doc(value.description))
    add(out, doc("| \"%s\""):format(value.name))
  end
end

local function generateSwizzlePermutations(fields, length)
  local permutations = {}

  local function go(swizzle)
    swizzle = swizzle or ""

    if #swizzle == length then
      add(permutations, swizzle)
    else
      for _, field in ipairs(fields) do
        go(swizzle .. field)
      end
    end
  end

  go()

  return permutations
end

local function renderSwizzleFields(out, fields)
  for i = 1, 4 do
    local type = i == 1 and "number" or "Vec" .. i
    local comp = i == 1 and "component" or "components"

    for _, swizzle in ipairs(generateSwizzlePermutations(fields, i)) do
      local desc = ("The %s %s of the vector."):format(swizzle, comp)
      add(out, doc(("@field %s %s %s"):format(swizzle, type, desc)))
    end
  end
end

--- Renders a module's information to CATS format.
local function renderModule(mod)
  local out = {}

  add(out, doc("@meta"))
  add(out, "")

  if mod.description then
    add(out, doc(mod.description))
    add(out, doc(""))
  end

  add(out, doc(("@class %s"):format(mod.key)))
  add(out, ("%s = {}"):format(mod.key))

  -- Render functions
  for _, func in ipairs(mod.functions) do
    renderFunction(out, func)
  end

  -- Render objects
  for _, obj in ipairs(mod.objects) do
    add(out, "")
    add(out, doc(obj.description))
    add(out, doc("@class %s"):format(obj.key))

    -- fields
    if obj.fields then
      for _, field in ipairs(obj.fields) do
        add(out, doc(("@field %s %s %s"):format(field.name, field.type, field.description)))
      end
    end

    -- swizzles
    if obj.swizzles then
      for _, swizzle in ipairs(obj.swizzles.components) do
        renderSwizzleFields(out, swizzle)
      end
    end

    -- see tags
    seeTags(out, obj)

    -- definition
    add(out, ("local %s = {}"):format(obj.name))

    -- Render object methods
    for _, func in ipairs(obj.methods) do
      renderFunction(out, func)
    end
  end

  -- Render enums
  for _, enum in ipairs(mod.enums) do
    renderEnum(out, enum)
  end


  return join(out, "\n")
end

local function generateModuleDocumentation(api)
  for _, v in ipairs(api.modules) do
    local text = renderModule(v)
    local filename = v.name
    writeFile(("library/%s.lua"):format(filename), text)
  end
end

local function renderCallback(out, callback)
  renderFunctionHeader(out, callback)
  for i = 1, #callback.variants do
    local variant = callback.variants[i]
    renderType(out, "@type", variant)
  end
  add(out, ("%s = nil"):format(callback.key))
end

local function generateCallbackDocumentation(api)
  local out = {}
  add(out, doc("@meta"))

  for _, callback in ipairs(api.callbacks) do
    renderCallback(out, callback)
  end

  writeFile("library/callback.lua", join(out, "\n"))
end

local function generateAddonConfig()
  local out = {}

  add(out, '{')
  add(out, '  "name": "LÖVR",')
  add(out, '  "words": ["lovr%.%w+"],')
  add(out, '  "settings": {')
  add(out, '    "Lua.runtime.version": "LuaJIT",')
  add(out, '    "Lua.diagnostics.globals": ["lovr"]')
  add(out, '  }')
  add(out, '}')

  writeFile("config.json", join(out, "\n"))
end

local function generateGlobalsDocumentation()
  local out = {}
  add(out, doc("@meta"))
  add(out, "vec2 = lovr.math.vec2")
  add(out, "Vec2 = lovr.math.newVec2")
  add(out, "vec3 = lovr.math.vec3")
  add(out, "Vec3 = lovr.math.newVec3")
  add(out, "vec4 = lovr.math.vec4")
  add(out, "Vec4 = lovr.math.newVec4")
  add(out, "mat4 = lovr.math.mat4")
  add(out, "Mat4 = lovr.math.newMat4")
  add(out, "quat = lovr.math.quat")
  add(out, "Quat = lovr.math.newQuat")

  writeFile("library/globals.lua", join(out, "\n"))
end

return function(api)
  local library = root .. "/cats/library"

  if lovr.system.getOS() == "Windows" then
    os.execute("mkdir " .. library:gsub("/", "\\"))
  else
    os.execute("mkdir -p " .. library)
  end

  generateModuleDocumentation(api)
  generateCallbackDocumentation(api)
  generateAddonConfig()

  if INCLUDE_GLOBALS then
    generateGlobalsDocumentation()
  end
end
