Welcome!
===

LÖVR is a framework for creating VR experiences with Lua.  It's great for small projects,
prototyping, creative coding, game jams, and more.

Why LÖVR?
---

LÖVR aims to be simple to use.  You can get up and running with just a few lines of Lua,
and there is no bloated editor to use, account to create, or compiling to do.

There is no cost to use LÖVR and it's open source, so you can use it for pretty much any
project without restrictions, and even modify the framework if you need to.

LÖVR is really fast.  It's written in C and uses LuaJIT, a crazy-fast just in time compiler for Lua
code.

Under the hood LÖVR uses OpenVR, so both the HTC Vive and the Oculus Rift are supported.  Support
for other headsets is also in the works.

Hello World
---

First, download LÖVR from the home page, or click [here](http://bjornbyt.es/f/lovr.zip).

You'll need a directory to hold the code for your game.  For this example, we'll create a folder
called `myGame`.  In the `myGame` folder we'll create a file called `main.lua`, which is the "entry
point" for any LÖVR project.  We'll put some code in `main.lua` that draws a cube:

    function lovr.draw()
      lovr.graphics.cube('line', 0, 1, 0, .5)
    end

The numbers `(0, 1, 0)` are the x, y, z, position of the cube in meters.  So the cube will be drawn
one meter off the ground.  The number `.5` is the size of the cube, in meters.

Start SteamVR, then drag and drop the `myGame` folder onto `lovr.exe`.  Put on your headset and you
should see a white cube at the center of your play area!
