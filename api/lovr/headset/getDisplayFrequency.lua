return {
  tag = 'headset',
  deprecated = 'Replaced by `lovr.headset.getRefreshRate`.',
  summary = 'Get the refresh rate of the display.',
  description = 'Returns the refresh rate of the headset display, in Hz.',
  arguments = {},
  returns = {
    frequency = {
      type = 'number',
      description = 'The frequency of the display, or `nil` if I have no idea what it is.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'frequency' }
    }
  }
}
