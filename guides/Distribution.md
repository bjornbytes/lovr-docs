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

    $ cd /path/to/project
    $ zip -9qr project.lovr .

By convention, zip files containing LÖVR projects use the `.lovr` extension.  A zip archive can be
run with LÖVR by running `lovr project.lovr`, but isn't a standalone executable yet.

The next step is to **fuse** the zip onto the main LÖVR executable, which creates an executable that
runs the project instead of LÖVR's no game screen.  See platform-specific instructions below.

Windows
---

To create a Windows executable, append a zip archive of your project onto the LÖVR executable using
the following command:

    $ copy /b lovr.exe+MyProject.zip MyProject.exe

Then, distribute `MyProject.exe` along with all the `.dll` files that came with the original LÖVR
download.

:::note
Users will need to have a MSVC C++ runtime library installed to run the executable.
:::

:::note
Resource Hacker can be used to change the exe icon.
:::

Linux
---

Use `cat` to create a fused executable on Unix systems:

    $ cat /path/to/lovr MyProject.zip > MyProject
    $ chmod +x MyProject

Then, distribute `MyProject` along with all the `.so` files that came with the original LÖVR
download.

### AppImage

AppImage is a popular format for packaging programs in a single file, and is the method LÖVR uses to
distribute its precompiled binaries for Linux.

To create an AppImage for a custom project, first make sure you have
[`appimagetool`](https://github.com/AppImage/appimagetool) installed.

To start, download one of LÖVR's prebuilt AppImages and extract it to a folder:

    $ chmod +x LÖVR-x86_64.AppImage
    $ ./LÖVR-x86_64.AppImage --appimage-extract

This should create a folder named `squashfs-root` with a `lovr` executable and other libraries in
it.

Next, fuse the project zip archive onto the executable:

    $ cat lovr MyProject.zip > MyProject
    $ chmod +x MyProject

Then, edit the `AppRun` script and replace `lovr` with `MyProject`, or whatever you named your
executable.

You can edit `lovr.desktop` and `logo.svg` to customize the metadata and icon for the app.

Finally, run `appimagetool` to bundle everything into an AppImage.  From the `squashfs-root`
directory, run:

    $ appimagetool .

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

:::note
If you build your own .app with CMake, you'll need to bundle MoltenVK into the app bundle, otherwise
users will need to install MoltenVK to run the app.  See the [GitHub Actions workflow](https://github.com/bjornbytes/lovr/blob/652d6c80defba554d785c9747e2f5e023fd3f60e/.github/workflows/build.yml#L145-L149)
for the commands used to bundle MoltenVK.  If you use a precompiled macOS build from the website,
this is already taken care of for you.
:::

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
