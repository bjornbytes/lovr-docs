Libraries
===

Libraries are external packages that you can import and use in your projects.  Some libraries extend
the capabilities of LÖVR and others just make it easier to get stuff done.  Libraries are usually
distributed as a single Lua file.  You can copy the Lua file into your project and `require` it to
use the library:

```
-- library.lua is sitting next to our main.lua here
local lib = require('library')

function lovr.load()
  lib.doStuff()
end
```

Below is a catalog of useful libraries.  All of them can be used with LÖVR, although some of them
only depend on Lua and aren't specific to LÖVR.

List of Libraries
---

- [30log](https://github.com/Yonaba/30log) - A library for object oriented programming in Lua.
- [cpml](https://github.com/excessive/cpml) - A 3D math library for Lua.
- [flux](https://github.com/rxi/flux) - A tweening library for Lua.
- [knife](https://github.com/airstruck/knife) - A collection of useful micromodules for Lua.
- [lodr](https://github.com/mcclure/lodr) - A live-reloading wrapper for LÖVR.
- [lovr-ent](https://github.com/mcclure/lovr-ent) - Entity tree library / sample project.
- [lovr-grid](https://github.com/bjornbytes/lovr-grid) - A library for drawing grids.
- [lovr-haxe-wrappergen](https://github.com/excessive/lovr-haxe-wrappergen) - Haxe bindings for LÖVR.
- [lovr-icosphere](https://github.com/bjornbytes/lovr-icosphere) - A library to create icospheres.
- [lovr-keyboard](https://github.com/bjornbytes/lovr-keyboard) - Keyboard input
- [lovr-lighting](https://github.com/bjornbytes/lovr-lighting) - Simple lighting shaders to add to
- [lovr-mouse](https://github.com/bjornbytes/lovr-mouse) - Mouse input
- [lovr-oculus-mobile](https://github.com/mcclure/lovr-oculus-mobile) - Android information and
  tools for LÖVR.
- [lovr-pointer](https://github.com/bjornbytes/lovr-pointer) - A general pointer system that can be
  used to select objects or create teleporters.
- [lovr-window](https://github.com/Papaew/lovr-window) - A window module for LÖVR.
- [lume](https://github.com/rxi/lume) - Lua utility functions geared towards game development.
- [maf](https://github.com/bjornbytes/maf) - A 3D math library with vectors and quaternions.
- [pollr](https://github.com/ulydev/pollr) - LÖVR input polling.
- [tiny-ecs](https://github.com/bakpakin/tiny-ecs) - An entity component system for Lua.
- [tween.lua](https://github.com/kikito/tween.lua) - A tweening library for Lua.
- [Vivid](https://github.com/WetDesertRock/vivid) - A Lua library for color manipulations and
  conversions.
