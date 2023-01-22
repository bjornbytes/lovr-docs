Libraries
===

Libraries are external packages that you can import and use in your projects.  Some libraries extend
the capabilities of LÖVR and others just make it easier to get stuff done.  Libraries are usually
distributed as a single Lua file.  You can copy the Lua file into your project and `require` it to
use the library:

    -- library.lua is sitting next to our main.lua here
    local lib = require('library')

    function lovr.load()
      lib.doStuff()
    end

Also see the <a data-key="Plugins">Plugins</a> page for a list of useful plugins.

List of Libraries
---

LÖVR-specific libraries:

<table>
  <tbody>
    <tr>
      <td><a href="https://github.com/jmiskovic/indeck">inDECK</a></td>
      <td>A standalone 3D development environment focused on developing VR from within VR.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/jmiskovic/lite-lovr">lite-lovr</a></td>
      <td>A lightweight text editor written in Lua and hosted on LÖVR platform.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/mcclure/lodr">lodr</a></td>
      <td>A live-reloading wrapper for LÖVR.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/mcclure/lovr-ent">lovr-ent</a></td>
      <td>Entity tree library / sample project.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/excessive/lovr-haxe-wrappergen">lovr-haxe-wrappergen</a></td>
      <td>Haxe bindings for LÖVR.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bjornbytes/lovr-icosphere">lovr-icosphere</a></td>
      <td>A library to create icosphere meshes.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bjornbytes/lovr-keyboard">lovr-keyboard</a></td>
      <td>Keyboard input.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/alloverse/lovr-letters">lovr-letters</a></td>
      <td>A library for making VR keyboards.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bjornbytes/lovr-mouse">lovr-mouse</a></td>
      <td>Mouse input.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/jmiskovic/lovr-phywire">lovr-phywire</a></td>
      <td>Visualizer for LÖVR physics internals.</td>
    </tr>
    <tr>
      <td><a href="http://github.com/jmiskovic/lovr-procmesh">lovr-procmesh</a></td>
      <td>Generation of mesh primitives and constructive solid geometry (CSG) operations.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/immortalx74/lovr-ui">lovr-ui</a></td>
      <td>An immediate mode VR GUI library for LÖVR</td>
    </tr>
    <tr>
      <td><a href="https://github.com/Papaew/lovr-window">lovr-window</a></td>
      <td>Advanced settings for the desktop window.</td>
    </tr>
  </tbody>
</table>

General Lua libraries:

<table>
  <tbody>
    <tr>
      <td><a href="https://github.com/Yonaba/30log">30log</a></td>
      <td>A library for object oriented programming in Lua.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/rxi/classic">classic</a></td>
      <td>Class library.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/excessive/cpml">cpml</a></td>
      <td>A 3D math library for Lua.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/rxi/flux">flux</a></td>
      <td>A tweening library for Lua.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/airstruck/knife">knife</a></td>
      <td>A collection of useful micromodules for Lua.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/rxi/lume">lume</a></td>
      <td>Lua utility functions geared towards game development.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/lunarmodules/penlight">penlight</a></td>
      <td>Miscellaneous helpers.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bakpakin/tiny-ecs">tiny-ecs</a></td>
      <td>An entity component system for Lua.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/kikito/tween.lua">tween.lua</a></td>
      <td>A tweening library for Lua.</td>
    </tr>
  </tbody>
</table>
