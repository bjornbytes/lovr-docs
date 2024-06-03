return {
  summary = 'Find colliders that intersect an axis-aligned box.',
  description = [[
    Find colliders within an axis-aligned bounding box.  This is a fast but imprecise query that
    only checks a rough box around colliders.  Use `World:overlapShape` for an exact collision test.

    Rough queries like this are useful for doing a quick check before doing lots of more expensive
    collision testing.

    Pass a callback function to call for each collider detected, or leave the callback off and this
    function will return the first collider found.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the center of the box, in meters.',
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the center of the box, in meters.',
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the center of the box, in meters.',
    },
    width = {
      type = 'number',
      description = 'The width of the box, in meters',
    },
    height = {
      type = 'number',
      description = 'The height of the box, in meters',
    },
    depth = {
      type = 'number',
      description = 'The depth of the box, in meters.',
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the box, in meters.'
    },
    size = {
      type = 'Vec3',
      description = 'The size of the box, in meters.'
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
        A function to call when a collider is detected.  The function will be called with a single
        `Collider` argument.
      ]]
    }
  },
  returns = {
    collider = {
      type = 'Collider',
      description = 'A Collider that intersected the box.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'width', 'height', 'depth', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'position', 'size', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'x', 'y', 'z', 'width', 'height', 'depth', 'filter' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'size', 'filter' },
      returns = { 'collider' }
    }
  },
  notes = 'This will return sleeping colliders and sensors, but it will ignore disabled colliders.',
  related = {
    'World:querySphere',
    'World:overlapShape',
    'World:shapecast',
    'World:raycast'
  }
}
