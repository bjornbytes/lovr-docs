return {
  tag = 'headset',
  summary = 'Get the height of the headset display.',
  description = 'Returns the height of the headset display (both eyes), in pixels.',
  arguments = {},
  returns = {
    {
      name = 'height',
      type = 'number',
      description = 'The height of the display.'
    }
  },
  related = {
    'lovr.headset.getDisplayWidth',
    'lovr.headset.getDisplayDimensions'
  }
}
