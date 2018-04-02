return {
  summary = 'Update multiple vertices in the Mesh.',
  description = 'Update multiple vertices in the Mesh.',
  arguments = {
    vertices = {
      type = 'table',
      description = 'The new set of vertices.'
    },
    vertexData = {
      type = 'VertexData',
      description = 'The VertexData object to use the vertices from.'
    },
    start = {
      type = 'number',
      default = '1',
      description = 'The index of the vertex to start replacing at.'
    },
    count = {
      type = 'number',
      default = 'nil',
      description = [[
        The number of vertices to replace.  If nil, all vertices in the table or VertexData will be
        used.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'vertices', 'start', 'count' },
      returns = {},
    },
    {
      arguments = { 'vertexData', 'start', 'count' },
      returns = {},
    }
  },
  notes = [[
    The start index plus the number of vertices in the table should not exceed the maximum size of
    the Mesh.

    To use a VertexData, the Mesh and the VertexData must have the same format.
  ]]
}
