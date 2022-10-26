Compiling LÖVR
===

Compiling the LÖVR code yourself lets you create a custom LÖVR build so you can add your own
features or run it on other operating systems.  Below is a guide for setting up all the dependencies
and compiling the code on various types of systems.

Dependencies
---

LÖVR depends on the following libraries.  They are included as submodules in the `deps` directory of
the repository, so make sure you clone with the `--recursive` flag or run `git submodule update
--init` in an existing repository.

- Lua or LuaJIT
- GLFW (3.2+)
- OpenGL (3.3, ES3, or WebGL 2)
- assimp (4+)
- OpenVR (1.0.9, for `lovr.headset`)
- PhysicsFS (3+)
- OpenAL (1.17+ recommended for HRTF support)
- FreeType
- msdfgen
- ODE (for `lovr.physics`)
- Emscripten (optional, for compiling for web)

Windows
---

From the lovr folder, run these commands to create a build folder and compile the project using
CMake:

    mkdir build
    cd build
    cmake ..
    cmake --build .

The executable will then exist at `/path/to/lovr/build/Debug/lovr.exe`.  A LÖVR project (a folder
containing a `main.lua` script) can then be dropped onto `lovr.exe` to run it, or it can be run
via the command line as `lovr.exe path/to/project`.

macOS
---

Install the dependencies using your package manager of choice:

    brew install assimp glfw3 luajit physfs freetype openal-soft ode libccd

Next, build using CMake, as above:

    mkdir build
    cd build
    cmake ..
    cmake --build .

The lovr executable should exist in `lovr/build` now.  It's recommended to set up an alias or
symlink so that this executable can be found in your PATH environment variable.  Once that's done,
you can run a project like this:

    lovr /path/to/myGame

> You may need to set the `PKG_CONFIG_PATH` environment variable for OpenAL to be located properly.
> If you run into this, see [Troubleshooting](#troubleshooting) below for more info.

Linux
---

First, install the dependencies using your package manager of choice.

#### Arch Linux

    pacman -S assimp glfw-x11 luajit physfs freetype2 openal ode

#### Debian/Ubuntu

    sudo apt-get install build-essential cmake libassimp-dev libglfw3-dev libluajit-5.1-dev libphysfs-dev libfreetype6-dev libopenal-dev libode-dev

Then, build with CMake:

    mkdir build
    cd build
    cmake ..
    cmake --build .

On Linux, LÖVR needs to run within the Steam Runtime.  To do this, first [install
Steam](https://wiki.archlinux.org/index.php/Steam#Installation).  Next, [install the Steam udev
rules](https://github.com/ValveSoftware/SteamVR-for-Linux#usb-device-requirements).  Then, run LÖVR
within the Steam runtime:

    ~/.steam/steam/ubuntu12_32/steam-runtime/run.sh lovr

If you receive errors related to `libstdc++`, set the `LD_PRELOAD` environment variable when running
the command:

    LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1' ~/.steam/steam/ubuntu12_32/steam-runtime/run.sh lovr

WebVR
---

First, install the Emscripten SDK.

Unix:

    mkdir build
    cd build
    emcmake cmake ..
    emmake make -j2

Windows (from a Visual Studio Command Prompt, make sure the Emscripten SDK is on PATH):

    mkdir build
    cd build
    emcmake cmake -G "NMake Makefiles" ..
    emmake nmake

The above commands will output `lovr.js` and `lovr.wasm`.  To package a game, run:

    python /path/to/emscripten/tools/file_packager.py game.data --no-heap-copy --preload /path/to/game@/ --js-output=game.js

Which will output `game.js` and `game.data`.  You can then include `lovr.js` and `game.js` on an
HTML page with a canvas element.  Check out [`lovr-webvr-server`](https://github.com/bjornbytes/lovr-webvr-server/blob/master/views/index.ejs) for an example.

Troubleshooting
---

- If you get "CMake no CMAKE_CXX_COMPILER found" on Windows, then install Visual Studio and create a
  blank C++ project, which will prompt you to install the compilers and tools necessary to compile
  LÖVR.
- On macOS, if you run into an error message about not being able to find OpenAL, make sure you've
  added the proper OpenAL directory (usually something like
  `/usr/local/opt/openal-soft/lib/pkgconfig`) to your `PKG_CONFIG_PATH` environment variable.
  Installing openal-soft with brew will print out a message telling you how to do this.
