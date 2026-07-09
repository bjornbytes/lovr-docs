return {
  tag = 'headset-misc',
  summary = 'Tries to connect to VR hardware.',
  description = [[
    Tries to connect to headset hardware.  This will initialize OpenXR and query the system for any
    connected VR hardware.  It must be called before other functions like `lovr.headset.start` can
    be called.  It may be desirable to avoid calling this function until later, because it will e.g.
    cause the SteamVR window to pop up, and may delay the rest of LÖVR's startup.

    Usually this is called automatically by boot.lua, but you can disable this behavior by setting
    `t.headset.connect` to false in `lovr.conf`.
  ]],
  arguments = {},
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the headset was successfully connected.'
    },
    error = {
      type = 'string?',
      description = 'The error message, on failure.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'success', 'error' }
    }
  },
  related = {
    'lovr.headset.start',
    'lovr.headset.stop'
  }
}
