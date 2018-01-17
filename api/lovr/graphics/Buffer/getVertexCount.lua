return {
  summary = 'Get the number of vertices the Buffer can hold.',
  description = 'Returns the maximum number of vertices the Buffer can hold.',
  arguments = {},
  returns = {
    {
      name = 'size',
      type = 'number',
      description = 'The number of vertices the Buffer can hold.'
    }
  },
  notes = 'The size can only be set when creating the Buffer, and cannot be changed afterwards.'
}
