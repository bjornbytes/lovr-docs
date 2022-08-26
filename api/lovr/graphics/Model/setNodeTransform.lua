return {
  summary = 'Set or blend the transform of a node.',
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
    transform = {
      type = 'transform',
      description = 'The target transform.'
    },
    blend = {
      type = 'number',
      default = '1.0',
      description = [[
        A number from 0 to 1 indicating how much of the target transform to blend in.  A value of 0
        will not change the node's transform at all, whereas 1 will fully blend to the target
        transform.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'index', 'transform', 'blend' },
      returns = {}
    },
    {
      arguments = { 'name', 'transform', 'blend' },
      returns = {}
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
