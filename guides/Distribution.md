Distribution
===

LÖVR projects can be exported to standalone executables.  This guide will teach you how to export
and distribute a project.

Creating an Archive
---

The first step is to create an archive of your project, which is a zipped up version of its
contents.  On Windows you can select all the files in a project (**not** the project folder), right
click them, and choose "Send to" -> "Compressed (zip) folder".  On Unix systems, the `zip` utility
can be used:

    $ zip -9qr .

A zip archive can be run with LÖVR but isn't a standalone executable yet.

Creating an Executable
---

Once you have a project archive, it can be appended to the LÖVR binary to create a standalone
executable.  On Windows, this can be done using the command prompt:

    $ copy /b lovr.exe+MyProject.zip MyProject.exe

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

When the LÖVR APK runs, it will search for and load a project located in the `assets` folder of the
APK.  Distributing an APK with a custom LÖVR project involves adding the project files into the
`assets` folder.  However, Android requires that the APK is resigned after it's modified.

LÖVR's build system has options for including assets in the APK.  For CMake, specify the
`-DANDROID_ASSETS=/path/to/project` option on the command line.  For tup, specify the
`CONFIG_ANDROID_PROJECT=/path/to/project` config variable in `tup.config`.  See the `Compiling`
guide for more info.

(TODO: Mention other approaches like `aapt add`, `apktool`, or manually unzipping/rezipping).
