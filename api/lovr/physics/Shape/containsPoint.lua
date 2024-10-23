return {
  summary = 'Check if a point is inside the shape.',
  description = [[
    Returns whether a point is inside the Shape.

    This takes into account the pose of the Shape's collider (if any), as well as its local offset
    set with `Shape:setOffset`.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the point.',
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the point.',
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the point.',
    },
    point = {
      type = 'Vec3',
      description = 'The point, as a vector.'
    }
  },
  returns = {
    hit = {
      type = 'boolean',
      description = 'Whether the point is inside the Shape.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'hit' }
    },
    {
      arguments = { 'point' },
      returns = { 'hit' }
    }
  },
  related = {
    'Shape:raycast',
    'World:raycast',
    'World:shapecast',
    'World:overlapShape',
    'World:queryBox',
    'World:querySphere'
  }
}
