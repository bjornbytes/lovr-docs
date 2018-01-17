return {
  summary = 'Set the draw range of the Buffer.',
  description = [[
    Set the draw range for the Buffer.  The draw range is a subset of the vertices of the buffer
    that will be drawn.
  ]],
  arguments = {
    {
      name = 'start',
      type = 'number',
      description = 'The first vertex that will be drawn.'
    },
    {
      name = 'count',
      type = 'number',
      description = 'The number of vertices that will be drawn.'
    }
  },
  returns = {}
}
