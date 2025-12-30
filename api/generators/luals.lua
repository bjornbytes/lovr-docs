local DOCS_URL = "https://lovr.org/docs/"

local OPERATOR_LOOKUP = {
    ["add"] = "add",
    ["sub"] = "sub",
    ["div"] = "div",
    ["mul"] = "mul",
    --["equals"] = "eq",
    --["length"] = "len",
}

-- this link usually assumes that anything with a proper API definition has to have
-- a documentation page. (it usually is the case.)
local function writeLink(key, f)
    f:write("---\n")
    f:write("--- [Open in browser](")
    f:write(DOCS_URL)
    f:write(key)
    f:write(")\n")
end

-- Breaks a multi-line string (such as a description) into a bunch of commented
-- likes.
-- CONSIDER: Maybe break them even further at periods? Not sure.
local function writeComment(cmt, f)
    for line in cmt:gmatch('[^\r\n]+') do
        f:write("--- ")
        f:write(line)
        f:write("\n")
    end
end

--- Turns a multiline string into a single line string.
local function writeSingleLine(cmt, f)
    f:write((cmt:gsub("\n", "")))
end

local function writeEnum(enum, f)
    writeComment(enum.description, f)

    --# ---@alias MyEnum
    f:write("---@alias ")
    f:write(enum.name)
    f:write("\n")

    --# --| 'Cool' # Denotes a particular coolness.
    for _, value in ipairs(enum.values) do
        f:write("---| '\"")
        f:write(value.name)
        f:write("\"' # ")
        writeSingleLine(value.description, f)
        f:write("\n")
    end

    f:write("\n")
end

-- Utility for translating from the pseudo-syntax used for types in Lövr's API
-- to the syntax used for LuaLS annotations.
local function handleType(t, tab)
    if tab then
        local entries = {}

        for _, e in ipairs(tab) do
            local opt = e.default and "?" or ""
            table.insert(entries, e.name .. ": " .. handleType(e.type, e.table) .. opt)
        end

        return "{" .. table.concat(entries, ", ") .. "}"
    end

    if t == "*" then -- * -> any
        return "any"
    end

    local a = t:match("{(.*)}") -- {type} -> type[]
    if a then
        return handleType(a) .. "[]"
    end

    if t:find("|") then -- {A | B} -> (A | B)
        local things = {}
        for item in t:gmatch("[^|]+") do
            -- trim whitespace around each item
            item = item:match("^%s*(.-)%s*$")
            table.insert(things, handleType(item))
        end

        return "(" .. table.concat(things, " | ") .. ")"
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
        f:write("---@operator ")
        f:write(name)
        f:write("(")
        f:write(table.concat(params, ", "))
        f:write(")")
        if #returns > 0 then
            f:write(": ")
            f:write(table.concat(returns, ", "))
        end
        f:write("\n")

        ::continue::
    end
end

local function handleParam(name)
    if name:sub(1, 3) == "..." then -- ...something -> ...
        return "..."
    end
    return name -- a -> a
end

local function writeFunction(func, namespace, is_method, f)
    local key = func.key
    local name = func.name

    writeComment(func.description, f)
    writeLink(key, f)

    if func.related then
        --# ---@see Robot.destroy
        for _, rel in ipairs(func.related) do
            f:write("---@see ")
            f:write((rel:gsub(":", ".")))
            f:write("\n")
        end
    end

    local params = {}
    local first = func.variants[1]
    do
        for _, arg in ipairs(first.arguments) do
            local param = handleParam(arg.name)
            local type = handleType(arg.type, arg.table) .. (arg.default and "?" or "")

            f:write("---@param ")
            f:write(param)
            f:write(" ")
            f:write(type)
            f:write(" # ")
            writeSingleLine(arg.description, f)
            if arg.default then
                f:write(" (default: ")
                f:write(arg.default)
                f:write(")")
            end
            f:write("\n")
            table.insert(params, param)
        end

        for _, ret in ipairs(first.returns) do
            f:write("---@return ")
            f:write(handleType(ret.type, ret.table))
            if ret.description then
                f:write(" # ")
                writeSingleLine(ret.description, f)
            end
            f:write("\n")
        end
    end

    for i = 2, #func.variants do
        local var = func.variants[i]

        local p = {}
        if is_method then
            table.insert(p, "self: " .. namespace)
        end

        for _, arg in ipairs(var.arguments) do
            local param = handleParam(arg.name)
            if arg.default then
                param = param .. "?"
            end
            table.insert(p, param .. ": " .. handleType(arg.type, arg.table))
        end

        local returns = {}
        for _, ret in ipairs(var.returns) do
            table.insert(returns, handleType(ret.type, ret.table))
        end

        f:write("---@overload fun(")
        f:write(table.concat(p, ", "))
        f:write(")")
        if #returns > 0 then
            f:write(": ")
            f:write(table.concat(returns, ", "))
        end
        f:write("\n")
    end

    f:write("function ")
    f:write(namespace)
    f:write(is_method and ":" or ".")
    f:write(name)
    f:write("(")
    f:write(table.concat(params, ", "))
    f:write(") end")

    f:write("\n\n")
end

local function writeCallback(call, f)
    local name = call.name
    local var = call.variants[1]

    local p = {}
    for _, arg in ipairs(var.arguments) do
        local param = handleParam(arg.name)
        if arg.default then
            param = param .. "?"
        end
        table.insert(p, param .. ": " .. handleType(arg.type, arg.table))
    end

    local returns = {}
    for _, ret in ipairs(var.returns) do
        table.insert(returns, handleType(ret.type, ret.table))
    end

    writeComment(call.description, f)
    writeLink("lovr." .. name, f)

    f:write("---@field ")
    f:write(name)
    f:write(" fun(")
    f:write(table.concat(p, ", "))
    f:write(")")
    if #returns > 0 then
        f:write(": ")
        f:write(table.concat(returns, ", "))
    end
    f:write("\n")
end

local function writeObject(object, f)
    local key = object.key
    local name = object.name

    writeComment(object.description, f)
    writeLink(key, f)

    --# ---@class Blob
    f:write("---@class ")
    f:write(name)
    if name == "Mat4" then
        f:write(": number[]")
    end
    f:write("\n")

    local vec_n = tonumber(name:sub(4))
    if vec_n and name:sub(1, 3) == "Vec" then
        local c = "xyzw"
        for i = 1, vec_n do
            f:write("---@field ")
            f:write(c:sub(i, i))
            f:write(" number\n")
        end
    end

    --if object.constructors then
    --    for _, const in ipairs(object.constructors) do
    --        f:write("---@see ")
    --        f:write(const)
    --        f:write(" # (Constructor)\n")
    --    end
    --end

    for _, func in ipairs(object.methods) do
        writeOperator(func, f)
    end

    --# local Blob = {}
    f:write("local ")
    f:write(name)
    f:write(" = {}\n\n")

    for _, func in ipairs(object.methods) do
        writeFunction(func, name, true, f)
    end

    return name
end

return function(api)
    local root = lovr.filesystem.getSource()

    local OUTPUT = root .. "/luals/"
    local API_OUTPUT = OUTPUT .. "library/"

    if lovr.system.getOS() == "Windows" then
        os.execute("mkdir " .. API_OUTPUT:gsub("/", "\\"))
    else
        os.execute("mkdir -p " .. API_OUTPUT)
    end

    print("Processing modules")
    for _, module in ipairs(api.modules) do
        local key = module.key
        local is_main_module = key == "lovr"

        io.write(("- %-20s"):format(key .. "..."))

        -- We skip external modules as they do not have any meaningful annotations.
        -- Plus, they often have their own, separately mantained annotations instead.
        if module.external then
            print("SKIP")
            goto continue
        end

        local f = io.open(API_OUTPUT .. key .. ".lua", "w+")
        assert(f, "Could not open file, make sure you got permissions!")

        --# ---@meta lovr.audio
        f:write("---@meta ")
        f:write(key)
        f:write("\n\n")

        writeComment(module.description, f)
        writeLink(key, f)

        --# ---@class lovr.audio
        f:write("---@class ")
        f:write(key)
        if is_main_module then
            f:write(": table\n")
            for _, call in ipairs(api.callbacks) do
                writeCallback(call, f)
            end
        else
            f:write("\n")
        end

        --# lovr.audio = {}
        f:write(key)
        f:write(" = {}\n\n")

        -- We do this order just because LuaLS might act up when
        -- types and functions are declared out of order.
        for _, enum in ipairs(module.enums) do
            writeEnum(enum, f)
        end

        for _, objt in ipairs(module.objects) do
            writeObject(objt, f)
        end

        for _, func in ipairs(module.functions) do
            writeFunction(func, key, false, f)
        end

        -- We write all the darn globals in the world.
        if is_main_module then
            f:write("vec2 = lovr.math.vec2\n")
            f:write("Vec2 = lovr.math.newVec2\n")
            f:write("vec3 = lovr.math.vec3\n")
            f:write("Vec3 = lovr.math.newVec3\n")
            f:write("vec4 = lovr.math.vec4\n")
            f:write("Vec4 = lovr.math.newVec4\n")
            f:write("mat4 = lovr.math.mat4\n")
            f:write("Mat4 = lovr.math.newMat4\n")
            f:write("quat = lovr.math.quat\n")
            f:write("Quat = lovr.math.newQuat\n")
        else
            f:write("return ")
            f:write(key)
        end
        f:close()

        print("OK")

        ::continue::
    end

    -- Write our manifest :)
    do
        local f = assert(io.open(OUTPUT .. "config.json", "w+"))

        f:write('{\n')
        f:write('    "name": "LÖVR",\n')
        f:write('    "words": ["lovr%.%w+"],\n')
        f:write('    "settings": {\n')
        f:write('        "Lua.runtime.version" : "LuaJIT"\n')
        f:write('    }\n')
        f:write('}\n')
        f:close()

        print("Manifest written successfully.")
    end
end
