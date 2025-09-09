return {
  summary = 'Get the local scale of a node.',
  description = 'Returns local scale of a node, relative to its parent.',
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    }
  },
  returns = {
    sx = {
      type = 'number',
      description = 'The x scale.'
    },
    sy = {
      type = 'number',
      description = 'The y scale.'
    },
    sz = {
      type = 'number',
      description = 'The z scale.'
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'sx', 'sy', 'sz' }
    }
  },
  related = {
    'ModelData:getNodePosition',
    'ModelData:getNodeOrientation',
    'ModelData:getNodePose',
    'ModelData:getNodeTransform'
  }
}
