return {
  summary = 'Find colliders that intersect a sphere.',
  description = [[
    Find colliders within a sphere.  This is a fast but imprecise query that only checks a rough box
    around colliders.  Use `World:overlapShape` for an exact collision test.

    Rough queries like this are useful for doing a quick check before doing lots of more expensive
    collision testing.

    Pass a callback function to call for each collider detected, or leave the callback off and this
    function will return the first collider found.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the center of the sphere.',
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the center of the sphere.',
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the center of the sphere.',
    },
    radius = {
      type = 'number',
      description = 'The radius of the sphere, in meters',
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the sphere.'
    },
    filter = {
      type = 'string',
      default = 'nil',
      description = [[
        An optional tag filter.  Pass one or more tags separated by spaces to only return colliders
        with those tags.  Or, put `~` in front of the tags to exclude colliders with those tags.
      ]]
    },
    callback = {
      type = 'function',
      description = [[
        A function to call when an intersection is detected.  The function will be called with a
        single `Collider` argument.
      ]]
    }
  },
  returns = {
    collider = {
      type = 'Collider',
      description = 'A Collider that intersected the sphere.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'radius', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'position', 'radius', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'x', 'y', 'z', 'radius', 'filter' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'radius', 'filter' },
      returns = { 'collider' }
    }
  },
  related = {
    'World:queryBox',
    'World:overlapShape',
    'World:shapecast',
    'World:raycast'
  }
}
