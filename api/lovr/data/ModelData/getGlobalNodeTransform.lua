return {
  summary = 'Get the global transform of a node.',
  description = 'Returns the transform of a node in the ModelData relative to the root.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the node (1-indexed).'
    },
    transform = {
      type = 'Transform',
      description = 'The Transform object to fill with the node\'s transform.'
    }
  },
  returns = {
    transform = {
      type = 'Transform',
      description = 'The supplied Transform.'
    },
    x = {
      type = 'number',
      description = 'The x position of the node.'
    },
    y = {
      type = 'number',
      description = 'The y position of the node.'
    },
    z = {
      type = 'number',
      description = 'The z position of the node.'
    },
    sx = {
      type = 'number',
      description = 'The x scale of the node.'
    },
    sy = {
      type = 'number',
      description = 'The y scale of the node.'
    },
    sz = {
      type = 'number',
      description = 'The z scale of the node.'
    },
    angle = {
      type = 'number',
      description = 'The angle the node is rotated around its axis of rotation.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'x', 'y', 'z', 'sx', 'sy', 'sz', 'angle', 'ax', 'ay', 'az' }
    },
    {
      arguments = { 'index', 'transform' },
      returns = { 'transform' }
    }
  },
  notes = 'An error will be thrown if an invalid node index is supplied.',
  related = {
    'ModelData:getLocalNodeTransform'
  }
}
