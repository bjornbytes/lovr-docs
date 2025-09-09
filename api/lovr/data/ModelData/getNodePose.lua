return {
  summary = 'Get the local pose of a node.',
  description = 'Returns local pose (position and orientation) of a node, relative to its parent.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x coordinate.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate.'
    },
    angle = {
      type = 'number',
      description = 'The number of radians the node is rotated around its axis of rotation.'
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
      arguments = { 'node' },
      returns = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'ModelData:getNodePosition',
    'ModelData:getNodeOrientation',
    'ModelData:getNodeScale',
    'ModelData:getNodeTransform'
  }
}
