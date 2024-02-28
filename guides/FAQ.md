FAQ
===

> Can I use LÖVR without a VR headset?

Yes, LÖVR will automatically use a fake headset system that you can control with your keyboard/mouse
if there isn't any VR hardware detected.

You can also set the `t.modules.headset` flag to false in `lovr.conf` to disable VR completely and
develop a traditional 3D desktop application.

Keep in mind that LÖVR is primarily designed for creating VR experiences, which have their own
design considerations.  This means that LÖVR does not prioritize features common in other
desktop-focused game engines like advanced control over the desktop window, joystick support,
touchscreens, etc.

> Is there any way to access keyboard/mouse input?

Yes, `lovr.system` has functions for keyboard and mouse input, and there are input events like
`lovr.keypressed`, `lovr.mousemoved`, etc.

> How is this project related to LÖVE?

LÖVR is heavily inspired by LÖVE and has a similar Lua API, but the 2 projects don't share any code.

> Does LÖVR support AR?

LÖVR should work on any AR headset that supports OpenXR and Vulkan.  More details:

- HoloLens is not known to work because it doesn't support Vulkan.
- Magic Leap 2 is supported, but requires compiling an `x86_64` APK, since LÖVR's prebuilt APKs are
  built for `arm64`.
- Apple Vision Pro is not known to work because it doesn't support OpenXR or Vulkan.
- Oculus Quest devices can use camera passthrough.
- SteamVR devices can use Room View 3D.

See `lovr.headset.getPassthrough` and `lovr.headset.setPassthrough` for managing how virtual content
blends with the real world.
