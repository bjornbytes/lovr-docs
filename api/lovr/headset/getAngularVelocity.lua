return {
  tag = 'headset',
  summary = 'Get the angular velocity of the headset.',
  description = 'Returns the current angular velocity of the headset.',
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x component of the angular velocity.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y component of the angular velocity.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z component of the angular velocity.'
    }
  },
  related = {
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getPosition'
  }
}
