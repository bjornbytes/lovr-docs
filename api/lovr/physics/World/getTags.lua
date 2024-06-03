return {
  summary = 'Get the World\'s list of collision tags.',
  description = [[
    Returns the list of collision tags that were specified when the World was created.  Tags are
    assigned to colliders using `Collider:setTag`, and collision can be enabled/disabled for pairs
    of tags with `World:enableCollisionBetween` and `World:disableCollisionBetween`.
  ]],
  arguments = {},
  returns = {
    tags = {
      type = 'table',
      description = 'A table of collision tags (strings).'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'tags' }
    }
  },
  related = {
    'lovr.physics.newWorld',
    'Collider:getTag',
    'Collider:setTag',
    'World:enableCollisionBetween',
    'World:disableCollisionBetween',
    'World:isCollisionEnabledBetween'
  }
}
