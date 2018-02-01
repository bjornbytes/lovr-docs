return {
  summary = 'Create a new Transform.',
  description = [[
    A transform is a 4x4, column major matrix that can be used to represent the 3D transform of an
    object.  Most graphics primitives accept a Transform instead of the usual coordinate arguments.
    Transforms provide a convenient way to represent translation, rotation, and scale in a single
    object.
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
      name = 'sx',
      type = 'number',
      description = 'The x scale of the Transform.'
    },
    {
      name = 'sy',
      type = 'number',
      description = 'The y scale of the Transform.'
    },
    {
      name = 'sz',
      type = 'number',
      description = 'The z scale of the Transform.'
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
      description = 'The new Transform.'
    }
  }
}
