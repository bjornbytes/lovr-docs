return {
  tag = 'headset',
  summary = 'Get the position of the headset.',
  description = 'Returns the current position of the headset.',
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the headset.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position of the headset.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position of the headset.'
    }
  },
  related = {
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity'
  }
}
