return {
  tag = 'worldQueries',
  summary = 'Move a shape through the world and return any colliders it touches.',
  description = [[
    Moves a shape from a starting point to an endpoint and returns any colliders it touches along
    its path.

    This is similar to a raycast, but with a `Shape` instead of a point.
  ]],
  arguments = {
    shape = {
      type = 'Shape',
      description = 'The Shape to cast.'
    },
    x1 = {
      type = 'number',
      description = 'The x position to start at.',
    },
    y1 = {
      type = 'number',
      description = 'The y position to start at.',
    },
    z1 = {
      type = 'number',
      description = 'The z position to start at.',
    },
    x2 = {
      type = 'number',
      description = 'The x position to move the shape to.',
    },
    y2 = {
      type = 'number',
      description = 'The y position to move the shape to.',
    },
    z2 = {
      type = 'number',
      description = 'The z position to move the shape to.',
    },
    angle = {
      type = 'number',
      description = 'The rotation of the shape around its rotation axis, in radians.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the rotation axis.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the rotation axis.'
    },
    az = {
      type = 'number',
      description = 'The z component of the rotation axis.'
    },
    position = {
      type = 'Vec3',
      description = 'The position to start at.'
    },
    destination = {
      type = 'Vec3',
      description = 'The position to move the shape to.'
    },
    orientation = {
      type = 'Quat',
      description = 'The orientation of the shape.'
    },
    filter = {
      type = 'string',
      default = 'nil',
      description = [[
        An optional tag filter.  Pass one or more tags separated by spaces to only return colliders
        with those tags.  Or, put `~` in front the tags to exclude colliders with those tags.
      ]]
    },
    callback = {
      type = 'function',
      arguments = {
        {
          name = 'collider',
          type = 'Collider'
        },
        {
          name = 'shape',
          type = 'Shape'
        },
        {
          name = 'x',
          type = 'number'
        },
        {
          name = 'y',
          type = 'number'
        },
        {
          name = 'z',
          type = 'number'
        },
        {
          name = 'nx',
          type = 'number'
        },
        {
          name = 'ny',
          type = 'number'
        },
        {
          name = 'nz',
          type = 'number'
        },
        {
          name = 'fraction',
          type = 'number'
        }
      },
      returns = {
        {
          name = 'limit',
          default = '1.0',
          type = 'number'
        }
      },
      description = 'The function to call when an intersection is detected (see notes).'
    }
  },
  returns = {
    collider = {
      type = 'Collider',
      description = 'The Collider that was hit.'
    },
    shape = {
      type = 'Shape',
      description = 'The Shape that was hit.'
    },
    x = {
      type = 'number',
      description = 'The x coordinate of the impact point.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the impact point.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the impact point.'
    },
    nx = {
      type = 'number',
      description = 'The x component of the normal vector.'
    },
    ny = {
      type = 'number',
      description = 'The y component of the normal vector.'
    },
    nz = {
      type = 'number',
      description = 'The z component of the normal vector.'
    }
  },
  variants = {
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', 'angle', 'ax', 'ay', 'az', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'position', 'destination', 'orientation', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', 'angle', 'ax', 'ay', 'az', 'filter' },
      returns = { 'collider', 'shape', 'x', 'y', 'z', 'nx', 'ny', 'nz' }
    },
    {
      arguments = { 'position', 'destination', 'orientation', 'filter' },
      returns = { 'collider', 'shape', 'x', 'y', 'z', 'nx', 'ny', 'nz' }
    }
  },
  notes = [[
    The callback function is passed a collider, a shape, a world-space point, a world-space normal,
    and a fraction:

        function(collider, shape, x, y, z, nx, ny, nz, fraction)
          return fraction
        end

    The callback can return a fraction value used to limit the range of further hits.  For example:

    - Returning 0.0 will abort the shapecast and ignore all other hits.
    - Returning 1.0 will call the callback for all hits.
    - Returning `fraction` will return successively closer hits.

    Shapecasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
  ]],
  related = {
    'World:raycast',
    'World:collideShape',
    'World:queryBox',
    'World:querySphere'
  }
}
