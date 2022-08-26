return {
  summary = 'Set or blend the position of a node.',
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
    position = {
      type = 'vector3',
      description = 'The target position.'
    },
    blend = {
      type = 'number',
      default = '1.0',
      description = [[
        A number from 0 to 1 indicating how much of the target position to blend in.  A value of 0
        will not change the node's position at all, whereas 1 will fully blend to the target
        position.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'index', 'position', 'blend' },
      returns = {}
    },
    {
      arguments = { 'name', 'position', 'blend' },
      returns = {}
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
