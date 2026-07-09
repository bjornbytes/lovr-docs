return {
  tag = 'headset',
  summary = 'Get the list of refresh rates supported by the display.',
  description = [[
    Returns a table with all the refresh rates supported by the headset display, in Hz.
  ]],
  arguments = {},
  returns = {
    rates = {
      type = '{number}?',
      description = [[
        A table of refresh rates supported by the headset display, or nil if the current VR runtime
        does not support changing the refresh rate.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'rates' }
    }
  },
  related = {
    'lovr.headset.getRefreshRate',
    'lovr.headset.setRefreshRate'
  }
}
