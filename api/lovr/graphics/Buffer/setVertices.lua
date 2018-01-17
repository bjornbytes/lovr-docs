return {
  summary = 'Update multiple vertices in the Buffer.',
  description = 'Update multiple vertices in the Buffer.',
  arguments = {
    {
      name = 'vertices',
      type = 'table',
      description = 'The new set of vertices.'
    }
  },
  returns = {},
  notes = [[
    The number of vertices in the table should not exceed the maximum size of the Buffer.
  ]]
}
