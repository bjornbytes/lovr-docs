return {
  summary = 'Get all the triangles in the Model.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'vertices',
      type = 'table',
      description = [[
        The triangle vertex positions, returned as a flat (non-nested) table of numbers.  The
        position of each vertex is given as an x, y, and z coordinate.
      ]]
    },
    {
      name = 'indices',
      type = 'table',
      description = 'The vertex indices.  Every 3 indices describes a triangle.'
    }
  },
  notes = 'After this function is called on a Model once, the result is cached (in its ModelData).',
  related = {
    'Model:getTriangleCount',
    'Model:getVertexCount',
    'ModelData:getTriangles'
  }
}
