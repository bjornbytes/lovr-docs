return {
  tag = 'headset',
  summary = 'Get the height of the headset display.',
  description = 'Returns the height of the display for each lens of the headset, in pixels.',
  arguments = {},
  returns = {
    {
      name = 'height',
      type = 'number',
      description = 'The height of each lens.'
    }
  },
  related = {
    'lovr.headset.getDisplayWidth',
    'lovr.headset.getDisplayDimensions'
  }
}
