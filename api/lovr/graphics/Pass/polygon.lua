return {
  tag = 'drawing',
  summary = 'Draw a polygon.',
  description = [[
    Draws a polygon.  The 3D vertices must be coplanar (all lie on the same plane),
    and the polygon must be convex (does not intersect itself or have any angles between vertices
    greater than 180 degrees), otherwise rendering artifacts may occur.
  ]],
  arguments = {
    x1 = {
      type = 'number',
      description = 'The x coordinate of the first vertex.'
    },
    y1 = {
      type = 'number',
      description = 'The y coordinate of the first vertex.'
    },
    z1 = {
      type = 'number',
      description = 'The z coordinate of the first vertex.'
    },
    x2 = {
      type = 'number',
      description = 'The x coordinate of the next vertex.'
    },
    y2 = {
      type = 'number',
      description = 'The y coordinate of the next vertex.'
    },
    z2 = {
      type = 'number',
      description = 'The z coordinate of the next vertex.'
    },
    t = {
      type = 'table',
      description = [[
        A table of numbers or `Vec3` objects (not a mix) representing vertices of the polygon.
      ]]
    },
    v1 = {
      type = 'Vec3',
      description = 'A vector containing the position of the first vertex of the polygon.'
    },
    v2 = {
      type = 'Vec3',
      description = 'A vector containing the position of the next vertex on the polygon.'
    },
    ['...'] = {
      type = '*',
      description = 'More vertices to add to the polygon.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', '...' },
      returns = {}
    },
    {
      arguments = { 't' },
      returns = {}
    },
    {
      arguments = { 'v1', 'v2', '...' },
      returns = {}
    }
  },
  notes = [[
    Currently, the polygon will not have normal vectors.

    `Mesh` objects can also be used to draw arbitrary triangle meshes.
  ]],
  related = {
    'Pass:points',
    'Pass:line',
    'Pass:draw'
  }
}
