return {
  summary = 'Get the position of a node.',
  description = 'TODO',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the node.'
    },
    name = {
      type = 'string',
      description = 'The name of the node.'
    },
    space = {
      type = 'CoordinateSpace',
      default = [['global']],
      description = 'The coordinate space to return the position in.'
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
      arguments = { 'index', 'space' },
      returns = { 'x', 'y', 'z' }
    },
    {
      arguments = { 'name', 'space' },
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
