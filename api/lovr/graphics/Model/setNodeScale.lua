return {
  summary = 'Set or blend the scale of a node.',
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
    scale = {
      type = 'vector3',
      description = 'The target scale.'
    },
    blend = {
      type = 'number',
      default = '1.0',
      description = [[
        A number from 0 to 1 indicating how much of the target scale to blend in.  A value of 0 will
        not change the node's scale at all, whereas 1 will fully blend to the target scale.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'index', 'scale', 'blend' },
      returns = {}
    },
    {
      arguments = { 'name', 'scale', 'blend' },
      returns = {}
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
