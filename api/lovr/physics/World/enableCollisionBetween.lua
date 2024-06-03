return {
  summary = 'Enable collision between two tags.',
  description = [[
    Enables collision between two tags.  Use `Collider:setTag` to set a Collider's tag.
  ]],
  arguments = {
    tag1 = {
      type = 'string',
      description = 'The first tag.'
    },
    tag2 = {
      type = 'string',
      description = 'The second tag.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'tag1', 'tag2' },
      returns = {}
    }
  },
  notes = [[
    By default, collision is enabled between all tags.

    Tags can be marked as "static" when the world is created, as an optimization hint.  Static tags
    will never collide with other static tags, regardless of whether collision is enabled between
    them.
  ]],
  related = {
    'World:disableCollisionBetween',
    'World:isCollisionEnabledBetween',
    'lovr.physics.newWorld',
    'World:getTags',
    'Collider:setTag'
  }
}
