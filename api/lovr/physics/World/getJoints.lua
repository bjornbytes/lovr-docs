return {
  summary = 'Get a list of joints in the World.',
  description = [[
    Returns a table with all the joints in the World.  This includes disabled joints.
  ]],
  arguments = {},
  returns = {
    joints = {
      type = 'table',
      description = 'The list of `Joint` objects in the World.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'joints' }
    }
  },
  related = {
    'World:getJointCount',
    'World:getColliders'
  }
}
