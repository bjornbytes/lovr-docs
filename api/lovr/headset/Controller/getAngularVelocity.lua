return {
  summary = 'Get the angular velocity of the Controller.',
  description = 'Returns the current angular velocity of the Controller.',
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
    'Controller:getVelocity',
    'Controller:getOrientation',
    'Controller:getPosition'
  }
}
