return {
  summary = 'Check if a collision tag is static.',
  description = [[
    Returns whether a collision tag was marked as static when the World was created.  Static tags
    will never collide with other static tags, regardless of whether collision is enabled between
    them.
  ]],
  arguments = {
    tag = {
      type = 'string',
      description = 'The tag to check.'
    }
  },
  returns = {
    static = {
      type = 'boolean',
      description = 'Whether the tag is static.'
    }
  },
  variants = {
    {
      arguments = { 'tag' },
      returns = { 'static' }
    }
  },
  notes = [[
    This function will throw an error if the tag does not exist.
  ]],
  related = {
    'lovr.physics.newWorld',
    'World:getTags',
    'Collider:getTag',
    'Collider:setTag'
  }
}
