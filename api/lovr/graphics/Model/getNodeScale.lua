return {
  summary = 'Get the scale of a node.',
  description = 'Returns the scale of a node.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    },
    origin = {
      type = 'OriginType',
      default = [['root']],
      description = [[
        Whether the scale should be returned relative to the root node or the node's parent.
      ]]
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x scale.'
    },
    y = {
      type = 'number',
      description = 'The y scale.'
    },
    z = {
      type = 'number',
      description = 'The z scale.'
    }
  },
  variants = {
    {
      arguments = { 'node', 'origin' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Model:getNodePosition',
    'Model:setNodePosition',
    'Model:getNodeOrientation',
    'Model:setNodeOrientation',
    'Model:getNodePose',
    'Model:setNodePose',
    'Model:getNodeTransform',
    'Model:setNodeTransform',
    'Model:animate'
  }
}
