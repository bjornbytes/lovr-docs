return {
  tag = 'headset',
  summary = 'Get the width of the headset display.',
  description = 'Returns the width of the headset display (for both eyes), in pixels.',
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of the display.'
    }
  },
  related = {
    'lovr.headset.getDisplayHeight',
    'lovr.headset.getDisplayDimensions'
  }
}
