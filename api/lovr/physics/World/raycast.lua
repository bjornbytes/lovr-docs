return {
  summary = 'Find colliders that intersect a line.',
  description = [[
    Traces a ray through the world and calls a function for each collider that was hit.

    The callback can be left off, in which case the closest hit will be returned.
  ]],
  arguments = {
    x1 = {
      type = 'number',
      description = 'The x coordinate of the origin of the ray.',
    },
    y1 = {
      type = 'number',
      description = 'The y coordinate of the origin of the ray.',
    },
    z1 = {
      type = 'number',
      description = 'The z coordinate of the origin of the ray.',
    },
    x2 = {
      type = 'number',
      description = 'The x coordinate of the endpoint of the ray.',
    },
    y2 = {
      type = 'number',
      description = 'The y coordinate of the endpoint of the ray.',
    },
    z2 = {
      type = 'number',
      description = 'The z coordinate of the endpoint of the ray.',
    },
    origin = {
      type = 'Vec3',
      description = 'The origin of the ray.'
    },
    endpoint = {
      type = 'Vec3',
      description = 'The endpoint of the ray.'
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
          name = 'triangle',
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
      description = 'The x coordinate of the impact point, in world space.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the impact point, in world space.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the impact point, in world space.'
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
    },
    triangle = {
      type = 'number',
      description = 'The index of the triangle that was hit, or nil if a MeshShape was not hit.'
    }
  },
  variants = {
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'origin', 'endpoint', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', 'filter' },
      returns = { 'collider', 'shape', 'x', 'y', 'z', 'nx', 'ny', 'nz', 'triangle' }
    },
    {
      arguments = { 'origin', 'endpoint', 'filter' },
      returns = { 'collider', 'shape', 'x', 'y', 'z', 'nx', 'ny', 'nz', 'triangle' }
    }
  },
  notes = [[
    The callback function is passed a collider, a shape, a world-space point, a world-space normal,
    and a fraction:

        function(collider, shape, x, y, z, nx, ny, nz, fraction)
          return fraction
        end

    The callback can return a fraction value used to limit the range of further hits.  For example:

    - Returning 0.0 will abort the raycast and ignore all other hits.
    - Returning 1.0 will call the callback for all hits.
    - Returning `fraction` will return successively closer hits.

    Raycasts will hit sensors and sleeping colliders, but will not hit disabled colliders.
  ]],
  related = {
    'Shape:raycast',
    'World:shapecast',
    'World:overlapShape',
    'World:queryBox',
    'World:querySphere'
  }
}
