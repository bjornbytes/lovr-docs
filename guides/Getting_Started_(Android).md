Getting Started
===

This guide explains how to start using LÖVR on Android devices like the Oculus Go and Oculus Quest.

After setting the device up for development, the LÖVR Android .apk is "sideloaded" onto the device.
From there, a LÖVR project on a PC can be sync'd to the device, and will automatically reload
whenever the files are changed.

Device Setup
---

First, make sure your device is set up for development.  Oculus has official device setup guides
for both the [Oculus Quest](https://developer.oculus.com/documentation/quest/latest/concepts/mobile-device-setup-quest/)
and [Oculus Go](https://developer.oculus.com/documentation/mobilesdk/latest/concepts/mobile-device-setup-go/),
but there are lots of other guides on the internet for how to do this.  The key things are:

- Enabling development mode on the device.
- Installing the `adb` tool used to communicate with the device.

Install the APK
---

Download the latest release version of the test apk from the [`lovr-oculus-mobile` release
page](https://github.com/mcclure/lovr-oculus-mobile/releases).

Install it to the device:

```
$ adb install /path/to/test-release.apk
```

Try running it by navigating to the "Library" -> "Unknown Sources" menu of the headset and running
the `org.lovr.test` app.  You should see a message about how to upload files.

Running a Project
---

Now we can create a LÖVR project, which is a folder with some code and assets in it.  Create a
folder called `hello-world` and add this code to a file named `main.lua` in there:

```
function lovr.draw()
  lovr.graphics.print('hello world', 0, 1.7, -3, .5)
end
```

Then use `adb` to sync it to the device:

```
$ adb push --sync /path/to/hello-world/. /sdcard/Android/data/org.lovr.test/files/.lodr
```

You should see the "hello world" message!

If the app is already running when a project is pushed, it will reload with the new code.  Also note
the trailing `.` in the path to the project, it's important!

Tips
---

- If you need to use `print` in Lua for debug messages, you can see those in a terminal by running
  `adb logcat -s LOVR`.

Next Steps
---

The next guide will teach you how to make fancier projects using <a data-key="Callbacks_and_Modules">Callbacks and Modules</a>.
