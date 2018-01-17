return {
  tag = 'headset',
  summary = 'Get the dimensions of the headset display.',
  description = 'Returns the dimensions of the display for each lens of the headset, in pixels.',
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of each lens.'
    },
    {
      name = 'height',
      type = 'number',
      description = 'The height of each lens.'
    }
  },
  related = {
    'lovr.headset.getDisplayWidth',
    'lovr.headset.getDisplayHeight'
  }
}
