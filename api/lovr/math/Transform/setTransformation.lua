return {
  summary = 'Set the position, rotation, and scale of the Transform.',
  description = [[
    Sets the translation, rotation, and scale of the Transform.  This will override the current
    values in the Transform.
  ]],
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the Transform.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The x position of the Transform.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The x position of the Transform.'
    },
    {
      name = 'scale',
      type = 'number',
      description = 'The scale of the Transform.'
    },
    {
      name = 'angle',
      type = 'number',
      description = 'The number of radians the Transform is rotated around its axis of rotation.'
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
