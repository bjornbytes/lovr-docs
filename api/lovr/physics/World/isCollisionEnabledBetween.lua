return {
  tag = 'worldCollision',
  summary = 'Check if two tags can collide.',
  description = [[
    Returns whether collisions are enabled between a pair of tags.
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
  returns = {
    enabled = {
      type = 'boolean',
      description = 'Whether or not two colliders with the specified tags will collide.'
    }
  },
  variants = {
    {
      arguments = { 'tag1', 'tag2' },
      returns = { 'enabled' }
    }
  },
  notes = [[
    If either tag is nil, this function returns true, for convenience.  For example, the following
    function will still work if either of the colliders don't have a tag:

        function willCollide(c1, c2)
          return world:isCollisionEnabledBetween(c1:getTag(), c2:getTag())
        end

    By default, collision is enabled between all tags.

    Tags can be marked as "static" when the world is created, as an optimization hint.  Static tags
    will never collide with other static tags, regardless of whether collision is enabled between
    them.
  ]],
  related = {
    'World:disableCollisionBetween',
    'World:enableCollisionBetween',
    'lovr.physics.newWorld',
    'World:getTags',
    'Collider:setTag'
  }
}
