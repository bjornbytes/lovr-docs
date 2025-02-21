return {
  tag = 'headset-misc',
  summary = 'Check if the headset session is active.',
  description = [[
    Returns whether a headset session is active.  When true, there is an active connection to the VR
    hardware.  When false, most headset methods will not work properly until `lovr.headset.start` is
    used to start a session.
  ]],
  arguments = {},
  returns = {
    active = {
      type = 'boolean',
      description = 'Whether the headset session is active.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'active' }
    }
  },
  related = {
    'lovr.headset.start',
    'lovr.headset.stop'
  }
}
