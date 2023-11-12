FAQ
===

> Can I use LÖVR without a VR headset?

Yes, LÖVR will automatically use a fake headset system that you can control with your keyboard/mouse
if there isn't any VR hardware detected.

You can also set the `t.modules.headset` flag to false in `lovr.conf` to disable VR completely and
develop a traditional 3D desktop application.

Keep in mind that LÖVR is primarily designed for creating VR experiences, which have their own
design considerations.  This means that LÖVR does not prioritize features common in other
desktop-focused game engines like advanced control over the desktop window, mouse input, joystick
support, touchscreens, etc.

> Is there any way to access keyboard/mouse input?

Yes, there are `lovr.keypressed`, `lovr.keyreleased`, and `lovr.textinput` callbacks.  For mouse
input, see `lovr-mouse` on the <a data-key="Libraries">Libraries</a> page.

> How is this project related to LÖVE?

LÖVR is heavily inspired by LÖVE and has a similar Lua API, but the 2 projects don't share any code.

> Does LÖVR support AR?

LÖVR does not currently support Magic Leap, HoloLens, or "magic window" style AR on phones.  There
are some ways to experiment with AR on LÖVR using passthrough devices like the North Star or
SteamVR's Room View 3D.  LÖVR's direction is guided by the community, and as more AR hardware comes
out there will likely be future demand and development on AR support.
