return {
  summary = 'Set or blend the pose of a node.',
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
    orientation = {
      type = 'rotation',
      description = 'The target orientation.'
    },
    blend = {
      type = 'number',
      default = '1.0',
      description = [[
        A number from 0 to 1 indicating how much of the target pose to blend in.  A value of 0 will
        not change the node's pose at all, whereas 1 will fully blend to the target pose.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'index', 'position', 'orientation', 'blend' },
      returns = {}
    },
    {
      arguments = { 'name', 'position', 'orientation', 'blend' },
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
    'Model:getNodeTransform',
    'Model:setNodeTransform',
    'Model:animate'
  }
}
