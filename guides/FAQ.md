FAQ
===

Frequently asked questions.

> Can I use LÖVR without a VR headset?

Yes, LÖVR will automatically use a fake headset system that you can control with your keyboard/mouse
if there isn't any VR hardware detected.

You can also set the `t.modules.headset` flag to false in
`lovr.conf` to disable VR completely and develop a traditional 3D desktop application.

> Does LÖVR work with mobile devices (Cardboard, Gear VR, Oculus Go, etc.)?

There isn't official support for mobile hardware yet.  However, you can run projects in a browser
using WebVR and those will usually work on mobile devices.  An Android port is also in progress but
isn't available yet.

> Are there macOS binaries available?

Yes, you can download them from <https://lovr.org/download/mac>.

> Is there any way to access keyboard/mouse input?

Yes, see `lovr-keyboard` and `lovr-mouse` on the <a data-key="Libraries">Libraries</a> page.

> Does LÖVR work on Linux?

Sorta.  Linux is an officially supported platform and LÖVR compiles on there.  However, not a lot of
testing is done on Linux, so sometimes you'll run into problems.  If you find anything wrong, please
open an issue or post in Slack about it so it can be fixed.
