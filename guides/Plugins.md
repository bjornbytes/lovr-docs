Plugins
===

LÖVR has a small core.  Extra features can be provided by <a data-key="Libraries">Libraries</a>
written in Lua, or by plugins.  Plugins are similar to libraries -- they can be `require`d from Lua
to access their features.  However, instead of Lua files in a project folder, plugins are native
libraries (`.dll` or `.so` files) that are placed next to the lovr executable.

Using Plugins
---

To use a plugin, place its library file next to the lovr executable and `require` it from Lua:

    -- myplugin.dll is next to lovr.exe
    local myplugin = require 'myplugin'

    function lovr.load()
      myplugin.dothething()
    end

:::note
On Unix systems, some plugin files might be prefixed with `lib` (e.g. `liblovr-plugin.so`). In this
case, be sure to require the plugin with the lib prefix: `require 'liblovr-plugin'`.
:::

:::note
On Android, LÖVR looks for plugins in the `lib/arm64-v8a` folder of the APK.
:::

Plugins are not officially supported in WebAssembly yet, but this is theoretically possible.

List of Known Plugins
---

<table>
  <tbody>
    <tr>
      <td><a href="https://github.com/brainrom/lovr-luasocket">lovr-luasocket</a></td>
      <td>HTTP and socket support via luasocket</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bjornbytes/lua-cjson">lua-cjson</a></td>
      <td>Fast native JSON encoder/decoder</td>
    </tr>
    <tr>
      <td><a href="https://github.com/antirez/lua-cmsgpack">lua-cmsgpack</a></td>
      <td>Lua MessagePack C implementation.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bjornbytes/lua-deepspeech">lua-deepspeech</a></td>
      <td>Speech recognition using Mozilla's DeepSpeech library</td>
    </tr>
    <tr>
      <td><a href="https://github.com/bjornbytes/lua-enet">lua-enet</a></td>
      <td>enet for UDP multiplayer servers/clients</td>
    </tr>
    <tr>
      <td><a href="https://github.com/love2d/lua-https">lua-https</a></td>
      <td>Lua HTTPS module using native platform backends.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/luvit/luv">luv</a></td>
      <td>libuv bindings for Lua</td>
    </tr>
  </tbody>
</table>

Building Plugins with CMake
---

LÖVR's CMake build system has support for automatically building plugins from source code.  In the
main lovr folder, a `plugins` folder can be created, containing a subfolder for each plugin to
build.  CMake will check all the subfolders of `plugins`, building anything with a `CMakeLists.txt`
file.  Their libraries will automatically be moved next to the final lovr executable, or packaged
into the apk on Android.

Inside the plugins' `CMakeLists.txt` scripts, the `LOVR` variable will be set to `1`, so libraries
can detect when they're being built as lovr plugins.  Plugins also automatically have access to the
version of Lua used by LÖVR, no calls to `find_package` are needed.

This makes it easier to manage plugins -- they can be copied, symlinked, cloned with git, or added
as git submodules.  A fork of lovr can be created that has this custom plugins folder, making it
easy to quickly get a set of plugins on multiple machines.  Version control also means that the
plugins are versioned and tied to a known version of lovr.

:::note
By default, the libraries from all CMake targets in the plugin's build script will be moved to the
executable folder.  Plugins can override this by setting the `LOVR_PLUGIN_TARGETS` variable to a
semicolon-separated list of targets.
:::

Creating Plugins
---

Internally, a plugin is no different from a regular native Lua library.  A plugin library only needs
to have a Lua C function with a symbol named after the plugin:

    int luaopen_supermegaplugin(lua_State* L) {
      // This code gets run when the plugin is required,
      // and the value it leaves at the top of the stack
      // is used as require's return value.
    }

All of [Lua's rules](https://www.lua.org/manual/5.1/manual.html#pdf-package.loaders) for native
plugin loading, including processing of dots and hyphens and all-in-one loading, apply to LÖVR
plugins.  However, note that LÖVR plugins do **not** use `package.cpath` or Lua's default loader.
The `lovr.filesystem` module has its own loader for loading plugins (it always looks for plugins
next to the executable, and checks the `lib/arm64-v8a` folder of the APK).

Android
---

### Adding Plugins to an APK

Instead of adding plugins to the `plugins` folder and building an APK with CMake, it is possible to
add a plugin library to an existing APK without recompiling the whole framework.

:::note
The plugin library must be compiled for the same architecture as the rest of the APK!  Most Android
devices use the ARM64 architecture (but Magic Leap 2 uses x86\_64). On Unix systems, you can run
`file myplugin.so` to check the architecture: it will say `ARM aarch64` for ARM64 or `x86-64` for
x86\_64.
:::

First, add the plugin to the APK.  APKs are just zip archives, so the `zip` command can do this.
It's important to add the library without any compression, using the `-Zs` flag.  The library also
needs to be in a `lib/arm64-v8a` folder, so it gets added to the correct path in the APK.

    zip -u -Zs lovr.apk lib/arm64-v8a/myplugin.so

Next, run zipalign on the APK.  This ensures the library is aligned to a 4096 byte page boundary,
which Android requires for libraries loaded from APKs.

    zipalign -f -p 4 lovr.apk lovr.apk.tmp

Finally, resign the APK:

    apksigner sign --ks /path/to/key.keystore --ks-pass pass:hunter2 --in lovr.apk.tmp --out lovr.apk

This will produce a new, signed APK with the plugin in it!

### Using JNI in Plugins

Android currently offers no way for a native library to get access to the `JNIEnv*` pointer if that
native library was loaded by another native library.  This means that LÖVR plugins have no way to
use the JNI.  To work around this, before LÖVR calls `luaopen_supermegaplugin`, it will call the
`JNI_OnLoad` function from the plugin (if present) and pass it the Java VM.  Example:

    #include <jni.h>

    static JNIEnv* jni;

    jint JNI_OnLoad(JavaVM* vm, void* reserved) {
      (*vm)->GetEnv(vm, (void**) &jni, JNI_VERSION_1_6);
      return 0;
    }

    int luaopen_supermegaplugin(lua_State* L) {
      // can use jni!
    }

Troubleshooting
---

If a plugin isn't loading properly, it can help to see errors from the dynamic linker.  On Linux,
the `LD_DEBUG` environment variable is able to print out a lot of information about library loading:

    LD_DEBUG=libs lovr .

On Android, setting the following property will log messages and errors from the dynamic linker:

    adb shell setprop debug.ld.app.org.lovr.app dlerror,dlopen
