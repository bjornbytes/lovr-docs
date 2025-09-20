return {
  summary = 'Get the transform of a node.',
  description = 'Returns the transform (position, scale, and rotation) of a node.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    },
    origin = {
      type = 'OriginType',
      default = [['root']],
      description = [[
        Whether the transform should be returned relative to the root node or the node's parent.
      ]]
    }
  },
  returns = {
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
      arguments = { 'node', 'origin' },
      returns = { 'x', 'y', 'z', 'sx', 'sy', 'sz', 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'Model:getNodePosition',
    'Model:setNodePosition',
    'Model:getNodeOrientation',
    'Model:setNodeOrientation',
    'Model:getNodeScale',
    'Model:setNodeScale',
    'Model:getNodePose',
    'Model:setNodePose',
    'Model:animate'
  }
}
