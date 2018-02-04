return {
  summary = 'Get the pose of the Controller.',
  description = 'Returns the current position and orientation of the Controller.',
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the Controller.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position of the Controller.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position of the Controller.'
    },
    {
      name = 'angle',
      type = 'number',
      description = 'The number of radians the Collider is rotated around its axis of rotation.'
    },
    {
      name = 'ax',
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  notes = 'Units are in meters.',
  related = {
    'Controller:getPosition',
    'Controller:getOrientation',
    'lovr.headset.getPose'
  }
}
