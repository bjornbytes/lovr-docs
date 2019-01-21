return {
  summary = 'Get the linear velocity of the Controller.',
  description = 'Returns the current linear velocity of the Controller, in meters per second.',
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
    'Controller:getPosition',
    'Controller:getOrientation',
    'Controller:getAngularVelocity'
  }
}
