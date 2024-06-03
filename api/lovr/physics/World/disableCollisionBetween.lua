return {
  summary = 'Disable collision between two tags.',
  description = [[
    Disables collision between two tags.  Use `Collider:setTag` to set a Collider's tag.
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

    Another way of disabling collisions is by using the `filter` callback in `World:setCallbacks`.
    However, using tags is much faster than using the callback, because the physics engine calls the
    callback later in the collision detection process.  With tags, the colliders are ignored much
    earlier and precise collision detection is never performed.

    Tags can be marked as "static" when the world is created, as an optimization hint.  Static tags
    will never collide with other static tags, regardless of whether collision is enabled between
    them.
  ]],
  related = {
    'World:enableCollisionBetween',
    'World:isCollisionEnabledBetween',
    'lovr.physics.newWorld',
    'World:getTags',
    'Collider:setTag'
  }
}
