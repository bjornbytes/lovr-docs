Luau
===

LÖVR supports [Luau](https://luau.org) in addition to PUC Lua and LuaJIT.  Compared to Lua, Luau
supports gradual typing, a builtin vector type, native code generation, and several convenient
[syntax improvements](https://luau.org/syntax).

LÖVR's Luau support is still early and should be considered experimental.  With that said, Luau can
run most LÖVR projects without any modifications.

Compiling
---

Currently, LÖVR has to be recompiled to enable Luau.  Set the `-DLOVR_USE_LUAU=ON` CMake variable
and rebuild.  See the `Compiling` guide for details.

Note that LÖVR uses a fork of Luau that makes Luau's C API closer to Lua's official C API and adds a
`quaternion` type in addition to the existing `vector` type.

Compatibility
---

While Luau is very close to Lua, there are some notable differences.

- No `io` library.
- The `os` library is missing many functions.
- The `debug` library is missing many functions.

See Luau's own [Compatibility with Lua](https://luau.org/compatibility) page for more details.

File Extensions
---

When Luau is enabled, the default require path is `?.luau;?/init.luau;?.lua;?/init.lua`, so
`require` will prioritize .luau files and fall back to .lua files.

Vectors
---

Luau's `vector` type is a fast builtin type natively supported by the VM.  Unlike tables, vectors do
not create any garbage, and they use the same amount of space as a single number value.

LÖVR makes a few modifications to Luau's `vector` library:

- In addition to `vector.create`, there is a `vector.pack` function that supports more overloads.
- Adds `vector.unpack` that unpacks the components of a vector.
- Adds `vector.length` as an alias for Luau's `vector.magnitude`.
- Adds `vector.distance`.

The `vector` library is also implemented on Lua and LuaJIT using tables, allowing the same code to
run on Lua, LuaJIT, and Luau.

Quaternions
---

In addition to `vector`, LÖVR's Luau fork implements a `quaternion` type.  Like `vector`, this is a
native, garbage-free type with optimizations in the VM.

Currently the quaternion type uses 16-bit signed normalized integers for storage.  This should be
enough precision for most game code, but please open an issue if it causes problems.

Plugins
---

Luau's C API is not compatible with Lua's C API.  This means that some plugins will fail to build
when compiling with Luau enabled.  All of LÖVR's builtin plugins (enet, http) currently support
Luau.

Native Codegen
---

LÖVR does not currently implement Luau's native codegen.

Luau LSP
---

[Luau LSP](https://github.com/JohnnyMorganz/luau-lsp) works with LÖVR.  To generate type
definitions, run `lovr api luau` from lovr-docs.

:::note
Luau's new type solver is not currently able to parse LÖVR's type definitions because it requires
definitions to be in a strict order, see [this issue](https://github.com/luau-lang/luau/issues/2096).
The V1 type solver works.
:::

### Require

LÖVR and Luau use different `require` systems, so by default luau-lsp won't understand LÖVR require
paths.  To fix this, use an [LSP plugin](https://github.com/JohnnyMorganz/luau-lsp/blob/main/src/Plugin/README.md)
that tells luau-lsp to treat require paths as relative to the root of the project.  Place this in a
`lovr-require.luau` file somewhere:

    return {
      transformSource = function(source, context)
        local root = lsp.workspace.getRootUri()
        local edits = {}

        local line = 1

        for text in source:gmatch('(.-)\n') do
          local first, last = text:find('require%(?[\'\"].-[\'\"]%)?')

          if first then
            local statement = text:sub(first, last)
            local module = statement:match('[\'\"](.-)[\'\"]')

            if module then
              local path = module:gsub('%.', '/')
              local absolutePath = root:joinPath(path).fsPath

              table.insert(edits, {
                startLine = line,
                startColumn = first,
                endLine = line,
                endColumn = last + 1,
                newText = string.format('require \'%s\'', absolutePath)
              })
            end
          end

          line = line + 1
        end

        return edits
      end
    } :: PluginApi

Then, configure luau-lsp to use the plugin:

    {
      plugins = {
        enabled = true,
        paths = {
          '/path/to/plugin.luau'
        },
        fileSystem = {
          enabled = true
        }
      }
    }
