return {
  summary = 'Update multiple vertices in the Mesh.',
  description = 'Update multiple vertices in the Mesh.',
  arguments = {
    {
      name = 'vertices',
      type = 'table',
      description = 'The new set of vertices.'
    },
    {
      name = 'start',
      type = 'number',
      default = '1',
      description = 'The index of the vertex to start replacing at.'
    },
    {
      name = 'count',
      type = 'number',
      default = 'nil',
      description = [[
        The number of vertices to replace.  If nil, all vertices in the table or VertexData will be
        used.
      ]]
    }
  },
  returns = {},
  notes = [[
    The start index plus the number of vertices in the table should not exceed the maximum size of
    the Mesh.
  ]]
}
