return {
  summary = 'Get the number of colliders in the world.',
  description = [[
    Returns the number of colliders in the world.  This includes sleeping and disabled colliders.
  ]],
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of colliders in the World.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  notes = [[
    The world has a maximum number of colliders, configured when creating the world.  The default is
    8192.  Trying to create more than this will error.
  ]],
  related = {
    'World:getColliders',
    'World:getJointCount'
  }
}
