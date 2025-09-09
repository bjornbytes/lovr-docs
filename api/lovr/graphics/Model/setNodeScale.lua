return {
  summary = 'Set or blend the scale of a node.',
  description = [[
    Sets or blends the scale of a node to a new scale.  This sets the local scale of the node,
    relative to its parent.
  ]],
  arguments = {
    node = {
      type = 'string | number',
      description = 'The name or index of a node.'
    },
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
    },
    scale = {
      type = 'Vec3',
      description = 'The new scale.'
    },
    blend = {
      type = 'number',
      default = '1.0',
      description = [[
        A number from 0 to 1 indicating how much of the new scale to blend in.  A value of 0 will
        not change the node's scale at all, whereas 1 will fully blend to the target scale.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'node', 'sx', 'sy', 'sz', 'blend' },
      returns = {}
    },
    {
      arguments = { 'node', 'scale', 'blend' },
      returns = {}
    }
  },
  notes = [[
    For best results when animating, it's recommended to keep the 3 scale components the same.
  ]],
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
