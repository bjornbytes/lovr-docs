lovr-docs
===

This repository contains the documentation for [LÖVR](https://github.com/bjornbytes/lovr).

There are four main types of documentation here:

- The **`api`** folder contains a Lua table with metadata for all LÖVR functions and objects.
  - Each function, object, module, etc. has a Lua file that exports its metadata.
  - `api/init.lua` contains a single Lua table with all the aggregated documentation.
  - This data is used to generate the documentation on the website, but there are also scripts to
  generate type definitions for other tools, like [LuaLS](https://luals.github.io) and [TypeScriptToLua](https://github.com/TypeScriptToLua/TypeScriptToLua).
  - Run `lovr api` to regenerate `init.lua`
  - Run `lovr api cats` to generate CATS definitions (output to `api/cats`).
  - Run `lovr api typescript` to generate TypeScriptToLua definitions (output to `api/typescript`).
  - The individual generator scripts are located at `api/generators`.
- The **`examples`** folder contains small LÖVR projects demonstrating a specific task/technique.
  They aim to be minimal and easy to understand/copy.
  - The ones listed in the `init.lua` file are shown on the website.
- The **`showcase`** folder contains full LÖVR projects that implement entire games or demos.  The
  code is less important for these and it is more about the end result.
  - The ones listed in the `init.lua` file are shown on the website.
  - Also, each showcase project may contain its own `init.lua` with metadata about the project.
  Currently, this can contain an `author` table with `name` and `link` strings.
- The **`guides`** folder contains markdown files that explain LÖVR-related concepts in depth.
  - Similarly, `init.lua` contains a manifest used to populate the sidebar on the website.

Note that each release of LÖVR has its own branch.  Cherry picks are used to propagate fixes to
relevant branches as needed.  Which will totally scale.

All the code in the example/showcase projects is released under CC0.  However, the models, textures,
sounds, and other assets used may use different licensing, so be sure to double check those.
