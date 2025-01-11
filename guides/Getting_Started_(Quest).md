Getting Started
===

This guide explains how to use LÖVR on Oculus Android devices like the Oculus Quest.

After setting the device up for development, the LÖVR Android .apk is "sideloaded" onto the device.
From there, a LÖVR project on a PC can be sync'd to the device.

Device Setup
---

First, make sure your device is set up for development.  Oculus has an official device setup guide
for the [Oculus Quest](https://developer.oculus.com/documentation/quest/latest/concepts/mobile-device-setup-quest/),
but there are lots of other guides on the internet for how to do this.  The key things are:

- Enabling development mode on the device.
- Installing the `adb` tool used to communicate with the device.

Install the APK
---

Download the latest Android APK from the [Downloads page](https://lovr.org/downloads).

Install it to the device:

    $ adb install lovr.apk

Try running it by navigating to the "Library" -> "Unknown Sources" menu of the headset and running
the `org.lovr.app` app.  You should see the no game screen.

Running a Project
---

Now we can create a LÖVR project, which is a folder with some code and assets in it.  Create a
folder called `hello-world` and add this code to a file named `main.lua` in there:

    function lovr.draw(pass)
      pass:text('hello world', 0, 1.7, -3, .5)
    end

Then use `adb` to sync it to the device:
insta
    $ adb push --sync /path/to/hello-world/. /sdcard/Android/data/org.lovr.app/files

Note the trailing `.` in the path to the project, it's important.

Restart the app.  You should see the "hello world" message!

Tips
---

- It is possible to restart the app from the command line by running:

<pre><code>adb shell am force-stop org.lovr.app
adb shell am start org.lovr.app/org.lovr.app.Activity
</code></pre>

- If you need to use `print` in Lua for debug messages, you can see those in a terminal by running
  `adb logcat -s LOVR`.

Hacker's Setup
---
We can do it either with official developer mode or without it.
Method without developer’s account is recommended for those who use their device without meta account. It’s highly recommended to block the connections to the meta servers in that case for example with Rethink to avoid anti-piracy kill switch. It's possible to do without PC.

**Let's begin!**

1. Either sideload via ADB (official way) or put following apps into your android phone/ usb flash drive and install them from the build in file manager:<br/>
[LightingLauncher](https://github.com/threethan/LightningLauncher)<br/>
[Shizuku](https://github.com/RikkaApps/Shizuku)<br/>
[MiXplorer](https://mixplorer.com/)<br/>
[F-Droid](https://f-droid.org/en/)<br/>
[Rethink](https://github.com/celzero/rethink-app) - Optional, for blocking traffic . Can be downloaded from F-Droid as well.<br/>

3. You will need another browser to download apk files on the headset:
    [Fennec](https://f-droid.org/en/packages/org.mozilla.fennec_fdroid/) from F-droid <br/> 
    or one can install [Aurora Store](https://f-droid.org/en/packages/com.aurora.store/) from F-droid (FOSS Google Play Client) and download Brave Browser (Highly recommended due to the multi-windows support on v72)

4. Now you can just go ahead and download it with freshly installed browser [Downloads page](https://lovr.org/downloads)
    Sometimes quest refuses to open apk file, so one can use MiXplorer to install them. 


**Now we probably want to write the code on the device without moving it back and forward using PC, but thanks to android restrictions we don't have an access to the data folder...yet:**

   1. We will need to follow the setup guide for Shizuku which will require ADB. 

   2. In case you don't have the developer's account, one can access Android Settings from the LightingLauncher and enable debugging just             like on any android device.

      2.1 It's highly recommend to block connections to meta servers to avoid kill switch.
      
      2.2 In case you don't have PC, you can install [Termux](https://f-droid.org/en/packages/com.termux/)
      and then install android-tools with
      <pre><code>pkg install android-tools
      </code></pre>
      
      2.3 Access your developer's settings, enable wireless debugging and pair your device with
      <pre><code> adb pair localhost:port
      </code></pre>
      
      2.4 Connect via
      <pre><code>adb connect localhost:port
      </code></pre> 
      
  3. Continue with Shizuku setup.
  4. In MiXplorer Enable Shizuku in "Settings" - "More settings", don't forget to start it first. 
  5. Now when you have access you can either edit code with build in code editor in MiXplorer
or with any other code editor such as [Acode](https://github.com/Acode-Foundation/Acode) (Using MiXplorer's "Open As" function") 
  6. Keep in mind that you will to restart Shizuku after each reboot, unless you use "Game-Tuner" autostart from the developer of LightingLauncher.
