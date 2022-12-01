Moonscript & Yuescript
===

[Yuescript](https://yuescript.org/) is a 
[Moonscript](https://moonscript.org) dialect.
Like Moonscript it
[trans-compiles](https://en.wikipedia.org/wiki/Source-to-source_compiler)
into Lua, thus both languages are Lövr scripting alternatives.

After the setup (in conf.lua) Lua and Yuescript/Moonscript modules can be required from each other
in the usual way.

It is also possible to enable support for both dialects.

Why and Which
---

Be warned, both languages are [white space sensitive](https://en.wikipedia.org/wiki/Off-side_rule).
If you can't stand this kind of syntax stop reading here.

Moonscript dialects come with a streamlined table constructor syntax,
making them suited not only for scripting but also for storage of your game's content data.

Featured are all kinds of additional syntactic sugar
and a class system for object oriented coding.

At the time of this writing (Dezember )
Yuescript is under active development and extends on Moonscript a lot already.
Moonscript on the other hand is more mature, more stable, features more/better editor support and is
better documented.

Precompiled Code
---

The simplest setup is compiling the codebase to Lua before shipping.
No extra dependencies are required in this setup.

### Yuescript

Use the '-l' flag which enables commenting each line of the Lua file with the corresponding
line-number in the source file:
    
    $ yue -l yourGame

A special error handler can extract this information 
and point to the correct line in the sourcefile when an error is thrown.

(TODO: Write more about this error handler function. I guess some yue function can be reused.)

### Moonscript

    $ moonc yourGame

(TODO: Write more about error line rewritting.)

Runtime Compilation
---

The more elegant solution is the trans-compilation at runtime.
Source and Lua files can't be out of sync and the setup is more developer friendly.

### Yuescript

Yuescript comes also (beside the standalone executable) in form of a Lua-clib binary.
You need to ship a different one for each operating system you want to support.

The Yuescript compiler takes care of the line-number translation,
no extra work needed in this setup.

There is a [pull request](https://github.com/pigpigyyy/Yuescript/pull/117)
pending for support of LÖVR's virtual filesystem,
meaning *require* will also work in the savedir directory and fuse mode is supported.

Hopefully Yuescript versions **> v.15.14** will ship with the mentioned LÖVR support.

Setup in conf.lua:

``` lua
-- this allows us to have a dedicated directory for lua-clibs.
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
-- linux and windows: beside the fused binary or in the savedir toplevel.
-- macOS: in the savedir toplevel
require('yue')

-- we search in the current directory and in the client directory.
-- It makes sense to keep Lua and Yuescript search paths in sync.
-- 'client' is just an example, adjust and extend these paths to your needs.
yue.options.path = './?.yue;./?/init.yue;client/?.yue;client/?/init.yue'
lovr.filesystem.setRequirePath('./?.lua;./?/init.lua;client/?.lua;client/?/init.lua')
-- Disable the conventional lua require path for easier testing if fuse mode works.
-- Every require relies on lovr.filesystem instead.
package.path = ''

-- require a file at client/config.yue for example.
-- In config.yue 'require' works like expected.
-- The rest of the configuration can be coded in Yuescript already.
yue('config')
```

The main.lua file:

``` lua
-- require file client/myMain.yue or client/myMain.lua for example
-- If both files are present the lua one is required.
require'myMain'
```

### Moonscript

Moonscript is implemented in Moonscript/Lua itself and thus operating system independent.
But it depends on [LPeg](http://www.inf.puc-rio.br/~roberto/lpeg/) which is a Lua-clib, although
there are pure Lua implementations available.

Setup in conf.lua:

``` lua
-- this allows us to have a dedicated directory for lua-clibs.
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

-- adjust the require search paths to your needs
local lua_path = './?.lua;./?/init.lua;utils/moonscript/?/init.lua;'
lovr.filesystem.setRequirePath(lua_path)

-- Moonscript must be located at utils. Check for utils/moonscript/moonscript/init.lua.
-- The LPeg library is to be located at:
-- linux:    utils/lua_clib/lpeg.so
-- windows:  utils\lua_clib\lpeg.dll
-- macOS:    utils/lua_clib/lpeg.so
-- fuse mode:
-- linux and windows: beside the fused binary or in the savedir toplevel.
-- macOS: in the savedir toplevel

-- Moonscript rewrites and sets its require paths from package.path when first required.
-- If you want to alter it afterwards redefine package.moon_path.
package.path = lua_path
require'moonscript'
-- Disable the conventional lua require path for easier testing if fuse mode works.
-- Every require relies on lovr.filesystem instead.
package.path = ''

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
