return {
  summary = 'Set the Collider\'s tag.',
  description = [[
    Sets the Collider's tag.

    Tags are strings that represent the category of a collider.  Use `World:enableCollisionBetween`
    and `World:disableCollisionBetween` to control which pairs of tags should collide with each
    other.  Physics queries like `World:raycast` also use tags to filter their results.

    The list of available tags is set in `lovr.physics.newWorld`.
  ]],
  arguments = {
    tag = {
      type = 'string',
      description = 'The Collider\'s tag.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'tag' },
      returns = {}
    },
    {
      description = 'Clear the Collider\'s tag.',
      arguments = {},
      returns = {}
    }
  },
  related = {
    'World:getTags',
    'World:disableCollisionBetween',
    'World:enableCollisionBetween',
    'World:isCollisionEnabledBetween',
    'lovr.physics.newWorld'
  }
}
