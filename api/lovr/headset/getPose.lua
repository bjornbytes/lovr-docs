return {
  tag = 'headset',
  summary = 'Get the pose of the headset.',
  description = 'Returns the current position and orientation of the headset.',
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position.'
    },
    {
      name = 'angle',
      type = 'number',
      description = 'The amount of rotation around the axis of rotation, in radians.'
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
    'lovr.headset.getPosition',
    'lovr.headset.getOrientation',
  }
}
