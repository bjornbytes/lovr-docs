Scripting Languages
===================

<a href="https://www.lua.org"><img align="right" width="300" height="300"
    src="http://lua-users.org/files/wiki_insecure/lua-full.ico" alt="Lua Logo"></a>

Currently [Lua](https://www.lua.org) is the only supported language for coding LÖVR projects.  
But there are several [languages](https://github.com/hengestone/lua-languages) available that
[trans-compile](https://en.wikipedia.org/wiki/Source-to-source_compiler) into Lua.

This document covers only some of them (in alphabetical order):

* [CSharp.lua (C# dialect)](#csharplua-c-dialect)
* [Fennel (Lisp/Clojure dialect)](#fennel-lispclojure-dialect)
* [Haxe (ECMAScript dialect)](#haxe-ecmascript-dialect)
* [Moonscript (CoffeeScript dialect)](#moonscript-coffeescript-dialect)
* [Wu (Rust dialect)](#wu-rust-dialect)
* [Yuescript (Moonscript dialect)](#yuescript-moonscript-dialect)

> A *dialect* means the language is inspired by the parent but not fully syntax compatible.

In general there are two ways of using one of them in a LÖVR project:

1. [Ahead-of-time compilation](https://en.wikipedia.org/wiki/Ahead-of-time_compilation)
    * simple setup  
        The simplest setup is compiling the codebase to Lua before shipping.
    * no additional dependencies  
        No additional compiler dependencies are required in this setup.
        Although the language might introduce runtime dependencies.
    * runtime error line translation  
        Most (or only some?) compilers allow to annotate each translated line with the
        corresponding one's number in the source file.
        A proper stack-trace with error lines rewritten requires the implementation of an
        error handler function making use of the annotations. 
    * virtual file-system
        works out of the box.

2. [Just-in-time compilation](https://en.wikipedia.org/wiki/Just-in-time_compilation)
    * more complex setup  
        This solution needs more additional coding inside the project. 
    * additional dependencies required  
        In this case the project must ship with the compiler library and its dependencies.
    * runtime error line translation  
        is usually done by the compiler without extra care.
    * virtual file-system
        The Lua loader for the language needs to make use of lovr.filesystem.read or it can't
        access files via the virtual file-system.
        Without a solution there are two issues:      
        1. save directory  
            Modules can't be required from within the LÖVR save directory.
            This is a problem when downloading modules is supported since it is the only place
            LÖVR allows writing to. 
        2. fuse mode  
            In fused mode the virtual file-system is the only working file access method.
            Meaning the project won't work at all if it relies on 'require'.

> The more elegant and recommended solution is the just-in-time compilation:
>
> * Source and Lua files can't be out of sync.
> * Developer friendly workflow.
> * Runtime error line translation is usually done by the compiler without extra care.
> * Allows reload during development.

CSharp.lua (C# dialect)
---

<a href="https://github.com/yanghuan/CSharp.lua"><img align="right" width="250" height="250"
    src="https://about.codecov.io/wp-content/uploads/2020/08/c-sharp-logo.svg" alt="C# Logo"></a>

* Home: [CSharp.lua Readme](https://github.com/yanghuan/CSharp.lua/blob/master/README.md) 
* Source: [github](https://github.com/yanghuan/CSharp.lua)
* Syntax: C# 7.0
* Semantic: C#
* jit compiler: (TODO)
* Features:
    * Industrial-quality
    * Readable lua code
    * supporting all the syntax features of C# 7.0
    * supports most of C# 9.0

(TODO: Is CSharp.lua really a dialect? It feels more like a full implementation.)

#### ahead-of-time

(TODO)

#### just-in-time

(TODO)

Fennel (Lisp/Clojure dialect)
---

<a href="https://fennel-lang.org"><img align="right" width="300" height="300"
    src="https://fennel-lang.org/logo.svg" alt="Fennel Logo"></a>

* Home: [Fennel](https://fennel-lang.org)
* Source: [github](https://github.com/bakpakin/Fennel)
* Syntax: [Lisp](https://en.wikipedia.org/wiki/Lisp_\(programming_language\)) /
[Clojure](https://clojure.org/) inspired
* Semantic: mostly Lua
* jit compiler: Pure Lua
* Dependencies: (TODO)
* Features
    * Macro support
    * Fully parenthesized prefix notation
    * Functional language

#### ahead-of-time

    $ fennel --compile yourProject

(TODO: error line translation)

#### just-in-time

* [Embedding Fennel](https://fennel-lang.org/setup#embedding-fennel)
* [Minimal LÖVR Setup](https://github.com/MattRoelle/min-lovr-fennel)

Haxe (ECMAScript dialect)
---

<a href="https://haxe.org"><img align="right" width="225" height="225"
    src="https://haxe.org/img/haxe-logo.svg" alt="Haxe Logo"></a>

* Home: [Haxe](https://haxe.org/)
* Source: [github](https://github.com/HaxeFoundation/haxe)
* Syntax: [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript) inspired
* Semantic: (TODO)
* jit compiler: Not available
* Dependencies: (TODO)
* Features:
    * Strictly typed
    * Object oriented
    * Array comprehension
    * Pattern matching
    * Properties
    * Type Parameters

#### ahead-of-time

* [Haxe Lua](https://haxe.org/manual/target-lua.html)
* [LÖVR bindings](https://github.com/excessive/lovr-haxe-wrappergen)

(TODO: Line Translation?)

#### just-in-time

Haxe does not offer runtime compilation.

Moonscript (CoffeeScript dialect) 
---
https://camo.githubusercontent.com/d1117c2c8b79b1cbc36249d12c0c91488d0b4b3688f19d56005ae717f0854ec0/68747470733a2f2f6c6561666f2e6e65742f64756d702f7361696c6f726d6f6f6e7363726970742e706e67
<a href="https://moonscript.org"><img align="right" width="450" height="225"
    src="http://moonscript.org/images/logo.png" alt="Moonscript Logo"></a>

* Home: [Moonscript](https://www.moonscript.org)
* Source: [github](https://github.com/leafo/moonscript)
* Syntax: [CoffeeScript](https://coffeescript.org) inspired
[(white space sensitive)](https://en.wikipedia.org/wiki/Off-side_rule)
* Semantic: Lua
* jit compiler: Lua + Lua C Library (LPeg) 
* Dependencies: [LPeg](http://www.inf.puc-rio.br/~roberto/lpeg/)
* Features:
    * Mature language with a good editor support
    * Class system for object oriented coding
    * Clean syntax avoiding keyword noise
    * List and Table Comprehensions

#### ahead-of-time

Compiles the whole project:

    $ moonc yourGame

(TODO: Write more about error line rewriting.)

#### just-in-time

Setup in conf.lua:

``` lua
    -- This allows us to have a dedicated directory for Lua c libraries.
    local os = lovr.system.getOS()
    if os == 'Linux' then
        package.cpath = 'utils/lua_clib/?.so'
    end
    if os == 'Windows' then
        package.cpath = 'utils/lua_clib/?.dll'
    end
    if os == 'macOS' then
        package.cpath = 'utils/lua_clib/?.so'
    end

    -- Adjust the require search paths to your needs.
    local lua_path = './?.lua;./?/init.lua;utils/moonscript/?/init.lua;'
    lovr.filesystem.setRequirePath(lua_path)

    -- Moonscript must be located at utils. Check for utils/moonscript/moonscript/init.lua.
    -- The LPeg library is to be located at:
    -- Linux:    utils/lua_clib/lpeg.so
    -- Windows:  utils\lua_clib\lpeg.dll
    -- MacOS:    utils/lua_clib/lpeg.so
    -- fuse mode:
    -- Linux and Windows: Beside the fused binary or in the save directory top-level.
    -- MacOS: In the save directory top-level

    -- Moonscript rewrites and sets its require paths from package.path when first required.
    -- If you want to alter it afterwards redefine package.moonpath.
    package.path = lua_path
    local moonscript = require'moonscript'
    -- Disable the conventional lua require path for easier testing if fuse mode works.
    -- Every require relies on lovr.filesystem instead.
    package.path = ''

    -- This loader uses lovr.filesystem instead of io.open.
    -- Enables require from LOVR's save directory.
    -- Fuse mode won't work at all without it.
    local moon_loader = function(name)
        local name_path = name:gsub("%.", "/")
        local file, file_path
        for path in package.moonpath:gmatch("[^;]+") do
            file_path = path:gsub("?", name_path)
            file = lovr.filesystem.read(file_path)
            if file then break end
        end
        if file then
            local res, err = moonscript.loadstring(file, "@" .. file_path)
            if not res then
                error(file_path .. ": " .. err)
            end
            return res
        end
        return nil, "Could not find moon file"
    end
    moonscript.remove_loader()
    local loaders = package.loaders or package.searchers
    table.insert(loaders, moon_loader)

    -- This will require the first .lua or .moon file matching the require paths.
    -- If both are present the Lua file is required.
    require'myConf'
```

The main.lua file:

``` lua
    -- Requires either .moon or .lua module files.
    -- If both are present the Lua one is required.
    require'myMain'
```

(TODO: Write about error line translation.)

Wu (Rust dialect)
---

<a href="https://wu-lang.gitbook.io/guide"><img align="right" width="300" height="300"
    src="https://preview.ibb.co/ePa1eH/wu_dragon.png" alt="Wu Logo"></a>

* Home: [Wu Guide](https://wu-lang.gitbook.io/guide)
* Source: [github](https://github.com/wu-lang/wu)
* Syntax: [Rust](https://rust-lang.org) inspired
* Semantic: (TODO)
* jit-compiler: Not available
* Dependencies: Rust
* Features
    * Gradual typing
    * Rust-like trait system
    * Expression oriented design
    * Pattern matching
    * Cool logo

#### ahead-of-time

[LÖVR bindings](https://github.com/darltrash/lowr)

#### just-in-time

There is no jit-compiler available for Wu.

Yuescript (Moonscript dialect)
---

<a href="https://yuescript.org"><img align="right" width="300" height="300"
    src="https://yuescript.org/image/yuescript.svg" alt="Yuescript logo"></a>

* Home: [Yuescript](https://yuescript.org)
* Source: [github](https://github.com/pigpigyyy/Yuescript)
* Syntax: [Moonscript](https://moonscript.org) inspired 
[(white space sensitive)](https://en.wikipedia.org/wiki/Off-side_rule)
* Semantic: Lua
* jit-compiler: Lua C library
* Dependencies: None
* Features:
    * Everything Moonscript is featuring.
    * Improved table literal syntax, suited for storage of your game's content data.
    * Expressive and extremely concise
    * Build-in macro support
    * Table matching
    * Under active development

#### ahead-of-time

Use the `-l` flag which enables commenting each line of the Lua file with the corresponding
line-number in the source file:
    
    $ yue -l yourGame

A special error handler can extract this information 
and point to the correct line in the source file when an error is thrown.

(TODO: Write more about this error handler function. I guess some Yuescript function can be reused.)

#### just-in-time

Yuescript comes also (beside the standalone executable) in form of a Lua c library.
You need to ship a different one for each operating system you want to support.

The Yuescript compiler takes care of the line-number translation,
no extra work needed in this setup.

After the setup (in conf.lua) Lua and Yuescript modules can be required from each other
in the usual way.

Setup in conf.lua:

``` lua
    -- This allows us to have a dedicated directory for Lua c libraries.
    local os = lovr.system.getOS()
    if os == 'Linux' then
        package.cpath = 'utils/lua_clib/?.so'
    end
    if os == 'Windows' then
        package.cpath = 'utils/lua_clib/?.dll'
    end
    if os == 'macOS' then
        package.cpath = 'utils/lua_clib/?.so'
    end

    -- This requires the Yuescript compiler library to be located at:
    -- linux:    utils/lua_clib/yue.so
    -- windows:  utils\lua_clib\yue.dll
    -- macOS:    utils/lua_clib/yue.so
    -- fuse mode:
    -- linux and windows: beside the fused binary or in the save directory top-level.
    -- macOS: in the save directory top-level
    require('yue')

    -- yue's uses of io.open need to be replaced with lovr.filesystem ones.
    -- This enables require to search the LÖVR save directory and is necessary for the fuse mode.
    yue.file_exist = lovr.filesystem.isFile
    yue.read_file  = function(fname)
        contents, bytes = lovr.filesystem.read(fname)
        if contents == nil then
            return nil, 'File not found.'
        end
        return contents
    end

    -- Search in the current directory and in the client directory.
    -- It makes sense to keep Lua and Yuescript search paths in sync.
    -- 'client' is just an example, adjust and extend these paths to your needs.
    yue.options.path = './?.yue;./?/init.yue;client/?.yue;client/?/init.yue'
    lovr.filesystem.setRequirePath('./?.lua;./?/init.lua;client/?.lua;client/?/init.lua')
    -- Disable the conventional Lua require path for easier testing if fuse mode works.
    -- Every require relies on lovr.filesystem instead.
    package.path = ''

    -- Require a file at client/config.yue for example.
    -- In config.yue 'require' works like expected.
    -- The rest of the configuration can be coded in Yuescript already.
    yue('config')
```

The main.lua file:

``` lua
    -- Require file client/myMain.yue or client/myMain.lua for example
    -- If both files are present the Lua one is required.
    require'myMain'
```    
