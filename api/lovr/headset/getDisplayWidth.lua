return {
  tag = 'headset',
  summary = 'Get the width of the headset display.',
  description = 'Returns the width of the display for each lens of the headset, in pixels.',
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of each lens.'
    }
  },
  related = {
    'lovr.headset.getDisplayHeight',
    'lovr.headset.getDisplayDimensions'
  }
}
