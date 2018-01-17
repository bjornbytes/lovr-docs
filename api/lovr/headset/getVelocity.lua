return {
  tag = 'headset',
  summary = 'Get the linear velocity of the headset.',
  description = 'Returns the current linear velocity of the headset, in meters per second',
  arguments = {},
  returns = {
    {
      name = 'vx',
      type = 'number',
      description = 'The x component of the linear velocity.'
    },
    {
      name = 'vy',
      type = 'number',
      description = 'The y component of the linear velocity.'
    },
    {
      name = 'vz',
      type = 'number',
      description = 'The z component of the linear velocity.'
    }
  },
  related = {
    'lovr.headset.getPosition',
    'lovr.headset.getOrientation',
    'lovr.headset.getAngularVelocity'
  }
}
