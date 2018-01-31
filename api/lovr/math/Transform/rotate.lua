return {
  summary = 'Rotate the Transform.',
  description = 'Rotates the Transform using an angle/axis rotation.',
  arguments = {
    {
      name = 'angle',
      type = 'number',
      description = 'The number of radians to rotate around the axis of rotation.'
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
  returns = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The original Transform.'
    }
  }
}
