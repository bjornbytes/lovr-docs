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

[Luau LSP](https://github.com/JohnnyMorganz/luau-lsp) works with LÖVR, and `lovr-docs` is able to
generate Luau type definitions.  However, Luau LSP does not currently understand LÖVR's `require`
function, which means it doesn't work for multi-file projects.

TODO: see if [source code transformation](https://github.com/JohnnyMorganz/luau-lsp/pull/1088) can
be used to fix this.
