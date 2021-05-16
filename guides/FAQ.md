FAQ
===

Frequently asked questions.

> Can I use LÖVR without a VR headset?

Yes, LÖVR will automatically use a fake headset system that you can control with your keyboard/mouse
if there isn't any VR hardware detected.

You can also set the `t.modules.headset` flag to false in
`lovr.conf` to disable VR completely and develop a traditional 3D desktop application.

> How do I get LÖVR to work with OpenXR?

Currently, OpenXR support is not included by default.  You can compile from source and add the
`-DLOVR_USE_OPENXR=ON` CMake option.  There are upcoming plans to include OpenXR by default.

> Are there macOS binaries available?

Yes, you can download them from <https://lovr.org/download/mac>.

> Is there any way to access keyboard/mouse input?

Yes, there are `lovr.keypressed`, `lovr.keyreleased`, and `lovr.textinput` callbacks.  For mouse
input, see `lovr-mouse` on the <a data-key="Libraries">Libraries</a> page.

> Does LÖVR work on Linux?

Sorta.  Linux is an officially supported platform and generally works, but there aren't a lot of
people using LÖVR/VR on Linux so problems come up from time to time.  If you do run into something,
please open an issue or post in Slack about it.
