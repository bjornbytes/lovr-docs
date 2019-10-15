Distribution
===

LÖVR projects can be exported to standalone executables or WebVR projects.  This guide will teach you
how to export and distribute a project.

Creating an Archive
---

The first step is to create an archive of your project, which is a zipped up version of its
contents.  On Windows you can select all the files in a project (**not** the project folder), right
click them, and choose "Send to" -> "Compressed (zip) folder".  On Unix systems, the `zip` utility
can be used:

```
$ zip -9qr .
```

A zip archive can be run with LÖVR but isn't a standalone executable yet.

Creating an Executable
---

Once you have a project archive, it can be appended to the LÖVR binary to create a standalone
executable.  On Windows, this can be done using the command prompt:

```
$ copy /b lovr.exe+MyProject.zip MyProject.exe
```

On Unix systems, the `cat` utility can be used to concatenate the two files.

> Once you have an executable, be sure to distribute it with all the `.dll` files that came with the
original LÖVR download.

macOS
---

To create a .app on macOS, first get the stock LÖVR.app, either by downloading it
[here](https://lovr.org/download/mac) or by setting the `-DLOVR_BUILD_BUNDLE=ON` flag when building
with CMake.

Then, to get the .app to run a custom project instead of the nogame screen, put a .lovr archive in
the `LÖVR.app/Contents/Resources` folder (right click and use "Show Package Contents" to get to the
Contents folder).

Next, the `Contents/Info.plist` should be modified.  The `CFBundleName` entry should be changed from
"LÖVR" to the name of the project, and the `CFBundleIdentifier` should also be changed to a unique
ID for the project/studio name.  The `Resources/lovr.icns` file can be replaced with a custom icon
as well.

Finally, `LÖVR.app` can be renamed to `Awesome VR Project.app` and distributed as a zip.

WebVR
---

To package a game for use in a browser, you can use the `file_packager` script that comes with the
Emscripten SDK:

```
$ python "$EMSCRIPTEN/tools/file_packager.py" game.data --no-heap-copy --preload /path/to/game@/ --js-output=game.js
```

This will output two files: `game.js` and `game.data`.  The `game.js` file downloads the `game.data`
contents and mounts it into the Emscripten filesystem, which LÖVR will then run at startup.

For full instructions on creating a web-enabled build of LÖVR, see the [Compiling guide](Compiling#webvr).
You can also use [lovr-webvr-server](https://github.com/bjornbytes/lovr-webvr-server) to develop a
WebVR project locally with live-reloading support.
