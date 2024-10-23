return {
  summary = 'Cast a ray against the shape',
  description = [[
    Casts a ray against the Shape and returns the first intersection.

    This takes into account the pose of the Shape's collider (if any), as well as its local offset
    set with `Shape:setOffset`.
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
    }
  },
  returns = {
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
    },
    triangle = {
      type = 'number',
      description = 'The index of the triangle that was hit, or `nil` if this is not a MeshShape.'
    }
  },
  variants = {
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2' },
      returns = { 'x', 'y', 'z', 'nx', 'ny', 'nz', 'triangle' }
    },
    {
      arguments = { 'origin', 'endpoint' },
      returns = { 'x', 'y', 'z', 'nx', 'ny', 'nz', 'triangle' }
    }
  },
  related = {
    'World:raycast',
    'Shape:containsPoint',
    'World:shapecast',
    'World:overlapShape'
  }
}
