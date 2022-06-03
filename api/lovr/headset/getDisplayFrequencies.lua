return {
  tag = 'headset',
  summary = 'Get the list of refresh rates supported by the headset display.',
  description = [[
    Returns a table with all the refresh rates supported by the headset display, in Hz.
  ]],
  arguments = {},
  returns = {
    {
      name = 'frequencies',
      type = 'table',
      description = [[
        A flat table of the refresh rates supported by the headset display, nil if not supported.
      ]]
    }
  },
  related = {
    'lovr.headset.setDisplayFrequency'
  }
}
