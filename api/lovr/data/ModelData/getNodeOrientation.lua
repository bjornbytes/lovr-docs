return {
  summary = 'Get the local orientation of a node.',
  description = 'Returns local orientation of a node, relative to its parent.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
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
      returns = { 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'ModelData:getNodePosition',
    'ModelData:getNodeScale',
    'ModelData:getNodePose',
    'ModelData:getNodeTransform'
  }
}
