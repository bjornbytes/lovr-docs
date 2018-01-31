return {
  summary = 'Different ways Mesh objects can be drawn.',
  description = [[
    Meshes are lists of arbitrary vertices.  These vertices can be drawn in a few different ways,
    leading to different results.
  ]],
  values = {
    {
      name = 'points',
      description = 'Draw each vertex as a single point.'
    },
    {
      name = 'strip',
      description = [[
        The first three vertices define a triangle.  Each vertex after that creates a triangle using
        the new vertex and last two vertices.
      ]]
    },
    {
      name = 'triangles',
      description = 'Each set of three vertices represents a discrete triangle.'
    },
    {
      name = 'fan',
      description = [[
        Draws a set of triangles.  Each one shares the first vertex as a common point, leading to a
        fan-like shape.
      ]]
    }
  }
}
