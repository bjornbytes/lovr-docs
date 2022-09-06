Distribution
===

LÖVR projects can be exported to standalone executables or WebXR projects.  This guide will teach you
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

Android
---

To create an APK for Android systems, the `-DANDROID_ASSETS=/path/to/project` CMake option can be
provided to include a LÖVR project in the APK when compiling.  See the `Compiling` guide for more
info.

(TODO: Mention other approaches like `aapt add`, `apktool`, or
unzipping/modifying/rezipping/resigning).
