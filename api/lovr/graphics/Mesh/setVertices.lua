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
    }
  },
  returns = {},
  notes = [[
    The start index plus the number of vertices in the table should not exceed the maximum size of
    the Mesh.
  ]]
}
