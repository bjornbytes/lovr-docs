return {
  summary = 'Get the local position of a node.',
  description = 'Returns local position of a node, relative to its parent.',
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
    }
  },
  variants = {
    {
      arguments = { 'node' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'ModelData:getNodeOrientation',
    'ModelData:getNodeScale',
    'ModelData:getNodePose',
    'ModelData:getNodeTransform'
  }
}
