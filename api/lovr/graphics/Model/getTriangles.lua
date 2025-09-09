return {
  summary = 'Get all the triangles in the Model.',
  description = [[
    Returns 2 tables containing mesh data for the Model.

    The first table is a list of vertex positions and contains 3 numbers for the x, y, and z
    coordinate of each vertex.  The second table is a list of triangles and contains 1-based indices
    into the first table representing the first, second, and third vertices that make up each
    triangle.

    The vertex positions will be affected by node transforms.
  ]],
  arguments = {},
  returns = {
    vertices = {
      type = '{number}',
      description = [[
        The triangle vertex positions, returned as a flat (non-nested) table of numbers.  The
        position of each vertex is given as an x, y, and z coordinate.
      ]]
    },
    indices = {
      type = '{number}',
      description = [[
        A list of numbers representing how to connect the vertices into triangles.  Each number is
        a 1-based index into the `vertices` table, and every 3 indices form a triangle.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'vertices', 'indices' }
    }
  },
  notes = 'After this function is called on a Model once, the result is cached (in its ModelData).',
  related = {
    'Model:getTriangleCount',
    'Model:getVertexCount',
    'Model:getMesh',
    'ModelData:getTriangles'
  }
}
