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

- Lua (5.1+) or LuaJIT (2.0+)
- GLFW (3.2+)
- OpenGL (3.3, ES3, or WebGL 2)
- OpenVR (1.0.9, for `lovr.headset`)
- Oculus SDK (optional, 1.26+)
- PhysicsFS (3+)
- OpenAL (1.17+ recommended for HRTF support)
- msdfgen
- ODE (for `lovr.physics`)
- Emscripten (optional, for compiling for web)

Windows
---

From the lovr folder, run these commands to create a build folder and compile the project using
CMake:

```
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

The executable will then exist at `/path/to/lovr/build/Debug/lovr.exe`.  A LÖVR project (a folder
containing a `main.lua` script) can then be dropped onto `lovr.exe` to run it, or it can be run
via the command line as `lovr.exe path/to/project`.

macOS
---

Install the dependencies using your package manager of choice:

```
$ brew install glfw3 luajit physfs openal-soft ode libccd
```

Next, build using CMake, as above:

```
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

The lovr executable should exist in `lovr/build` now.  It's recommended to set up an alias or
symlink so that this executable can be found in your PATH environment variable.  Once that's done,
you can run a project like this:

```
$ lovr /path/to/myGame
```

> You may need to set the `PKG_CONFIG_PATH` environment variable for OpenAL to be located properly.
> If you run into this, see [Troubleshooting](#troubleshooting) below for more info.

Linux
---

First, install the dependencies using your package manager of choice.

#### Arch Linux

```
$ pacman -S glfw-x11 luajit physfs openal ode
```

#### Debian/Ubuntu

```
$ sudo apt install build-essential cmake xorg-dev libglfw3-dev libluajit-5.1-dev libphysfs-dev libopenal-dev libode-dev libccd-dev libenet-dev
```

Then, build with CMake:

```
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

On Linux, LÖVR needs to run within the Steam Runtime.  To do this, first [install
Steam](https://wiki.archlinux.org/index.php/Steam#Installation).  Next, [install the Steam udev
rules](https://github.com/ValveSoftware/SteamVR-for-Linux#usb-device-requirements).  Then, run LÖVR
within the Steam runtime:

```
$ ~/.steam/steam/ubuntu12_32/steam-runtime/run.sh lovr
```

If you receive errors related to `libstdc++`, set the `LD_PRELOAD` environment variable when running
the command:

```
$ LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1' ~/.steam/steam/ubuntu12_32/steam-runtime/run.sh lovr
```

WebXR
---

First, [install the Emscripten SDK](https://emscripten.org/docs/getting_started/downloads.html).

Unix:

```
$ mkdir build
$ cd build
$ emcmake cmake ..
$ emmake make -j2
```

Windows (from a Visual Studio Command Prompt, make sure the Emscripten SDK is on PATH):

```
$ mkdir build
$ cd build
$ emcmake cmake -G "NMake Makefiles" ..
$ emmake nmake
```

The above commands will output `lovr.js`, `lovr.wasm`, and `lovr.html`.  The easiest way to run LÖVR
from here is to use `emrun`:

```
$ emrun --browser firefox lovr.html
```

To add a project, create a .zip of its contents and serve it alongside the HTML and JS files.  The
following JS can be added to the page to download the zip file, add it to the emscripten virtual
filesystem, and add it as a command line argument:

```js
var filename = 'game.zip';
var url = '/game.zip';
Module.arguments.push(filename);
Module.preRun.push(function() {
  Module.FS_createPreloadedFile('/', filename, url, true, false);
});
```

See `lovr.html` (or `src/resources/lovr.html`) for a full example page, including a button that
can be used to enter/exit immersive mode.

Android
---

Here be dragons.

First, make sure the Java JDK is installed (version 8 is known to work).

Then, the Android SDK and NDK need to be installed.  The SDK version to install depends on the
devices being targeted:

- Version 26: Oculus Quest.
- Version 21: Oculus Quest and Oculus Go.
- Version 27: Pico Neo 2.

The Android command line tools can be found on the Android website or installed using a package
manager.  The command line tools contain a tool named `sdkmanager` that can be used to install
various versions of Android, the Android build tools, and the NDK.

Android Studio isn't required, but can be used to install the SDK, NDK, and Java as well.

Note where the SDK is installed.  Some paths in the SDK will need to be specified.

CMake or tup can be used to build an APK that can be installed on an Android device.

When building for Oculus Android devices, download the latest Oculus Mobile SDK and copy the VrApi
folder from there into `deps`.

### tup

When using tup, third-party dependencies need to be built with CMake.  Follow the CMake instructions
below, but add `-DLOVR_BUILD_EXE=OFF` to only build the LÖVR dependencies.

Next, make sure you have a `tup.config` file in the repository root.  A sample config file can be
found at `config/default`.  Some android-specific configuration needs to be filled in there:

- Set `CONFIG_PLATFORM` to `android`.
- Set `CONFIG_ANDROID_SDK` to the path to the Android SDK.
- Set `CONFIG_ANDROID_VERSION` to the version of Android to use.  Check the `sdk/platforms` folder
  to see which Android versions are installed.
- Set `CONFIG_ANDROID_BUILD_TOOLS_VERSION` to the build tools version.  Check the `sdk/build-tools`
  folder to see which versions are installed.
- Set `CONFIG_HOST_TAG` to the type of computer you're using.  Examples:
  - `windows-x86_64` for 64 bit Windows.
  - `darwin-x86_64` for 64 bit macOS.
  - Other: Check `ndk-bundle/prebuilt` folder to see a list of them.
- Set `CONFIG_ANDROID_KEYSTORE` to the path to the keystore file.  See "Creating a Keystore" below
  for instructions on how to create a keystore.
- Set `CONFIG_ANDROID_KEYSTORE_PASS` to the password to the keystore file.  This can be used in
  multiple ways, described in "Creating a Keystore" below.
- Optional: To use a custom Android manifest XML, set `CONFIG_ANDROID_MANIFEST`.
- Optional: To embed assets in the APK (e.g. a project folder), set `CONFIG_ANDROID_ASSETS`.

Once all of this is set up, run `tup init` if tup hasn't been initialized yet.  Then run

```
$ tup
```

to build the apk.

### CMake

The following CMake variables need to be set, either using the CMake GUI or by using `-D` flags on
the command line:

- Set `CMAKE_TOOLCHAIN_FILE` to the path to `android.toolchain.cmake`.  This is usually at
  `ndk-bundle/build/cmake/android.toolchain.cmake` inside the Android SDK.
- Set `ANDROID_SDK` to the path to the Android SDK.
- Set `ANDROID_ABI` to `arm64-v8a`.
- Set `ANDROID_NATIVE_API_LEVEL` to the Android version to use (e.g. `26`).
- Set `ANDROID_BUILD_TOOLS_VERSION` to one of the versions listed in the `build-tools` folder.
- Set `ANDROID_KEYSTORE` to the path to they keystore file.  See "Creating a Keystore" below.
- Set `ANDROID_KEYSTORE_PASS` to the keystore password.  This can be used in multiple ways,
  described in "Creating a Keystore" below.
- Optional: Set `ANDROID_MANIFEST` to use a custom Android manifest XML file.
- Optional: Set `ANDROID_ASSETS` to include extra assets (e.g. a project folder) in the APK.
- Windows: Make sure you add `-G "Unix Makefiles"` so it doesn't try to use Visual Studio.

The usual CMake incantation with all of the above variables set up should produce `lovr.apk`:

```
$ cmake ..
$ cmake --build .
```

### Installing the APK

To install the APK, an Android device needs to be connected.  Run

```
$ adb devices
```

to ensure that a device is connected, then run

```
$ adb install lovr.apk
```

To install the apk.  The `-r` flag can be used to overwrite an existing apk.

### Adding Project Code

To build an apk that runs a LÖVR project, pass the folder path as the `ANDROID_ASSETS` option to
either CMake or tup.  This will run the LÖVR project when the apk starts, similar to how things work
when fusing a zip to an exe on desktop systems.

### Using a Custom Android Manifest

Although LÖVR provides a default `AndroidManifest.xml`, you can also use your own by passing its
path as the `ANDROID_MANIFEST` option to either CMake or tup.  This can be used to request extra
permissions, change the package ID or app name, etc.

Any file named `AndroidManifest*.xml` will be ignored in LÖVR's git repository.

### Creating a Keystore

A keystore file needs to be generated, which is used to sign the APK after it's built.

To generate a keystore, use Java's `keytool` tool:

```
$ keytool -genkey -keystore <name>.keystore -alias <name> -keyalg RSA -keysize 2048 -validity 10000
```

When specifying the password for the keystore, it can be done in multiple ways:

- `pass:<string>` will use `<string>` as the password.
- `env:<var>` will use the value of the `<var>` environment variable.
- `file:<file>` will use the contents of `<file>` as the password.

Troubleshooting
---

- If you get "CMake no CMAKE_CXX_COMPILER found" on Windows, then install Visual Studio and create a
  blank C++ project, which will prompt you to install the compilers and tools necessary to compile
  LÖVR.
- On macOS, if you run into an error message about not being able to find OpenAL, make sure you've
  added the proper OpenAL directory (usually something like
  `/usr/local/opt/openal-soft/lib/pkgconfig`) to your `PKG_CONFIG_PATH` environment variable.
  Installing openal-soft with brew will print out a message telling you how to do this.
