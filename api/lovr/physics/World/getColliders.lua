return {
  tag = 'colliders'
  summary = 'Get a list of colliders in the World.',
  description = [[
    Returns a list of colliders in the world.  This includes sleeping and disabled colliders.
  ]],
  arguments = {},
  returns = {
    colliders = {
      type = 'table',
      description = 'The list of `Collider` objects in the World.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'colliders' }
    }
  },
  related = {
    'World:getColliderCount',
    'World:getJoints'
  }
}
