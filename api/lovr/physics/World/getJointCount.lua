return {
  tag = 'joints',
  summary = 'Get the number of joints in the world.',
  description = [[
    Returns the number of joints in the world.  This includes disabled joints.
  ]],
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of joints in the World.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  related = {
    'World:getJoints',
    'World:getColliderCount'
  }
}
