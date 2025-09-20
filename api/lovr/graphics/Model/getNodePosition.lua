return {
  summary = 'Get the position of a node.',
  description = 'Returns the position of a node.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    },
    space = {
      type = 'OriginType',
      default = [['root']],
      description = [[
        Whether the position should be returned relative to the root node or the node's parent.
      ]]
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
    }
  },
  variants = {
    {
      arguments = { 'node', 'space' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Model:getNodeOrientation',
    'Model:setNodeOrientation',
    'Model:getNodeScale',
    'Model:setNodeScale',
    'Model:getNodePose',
    'Model:setNodePose',
    'Model:getNodeTransform',
    'Model:setNodeTransform',
    'Model:animate'
  }
}
