return {
  summary = 'Get the scale of a node.',
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
      description = 'The coordinate space to return the scale in.'
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
      arguments = { 'index', 'space' },
      returns = { 'x', 'y', 'z' }
    },
    {
      arguments = { 'name', 'space' },
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
