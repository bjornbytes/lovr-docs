return {
  summary = 'Get the draw range of the Buffer.',
  description = [[
    Retrieve the current draw range for the buffer.  The draw range is a subset of the vertices of
    the buffer that will be drawn.
  ]],
  arguments = {},
  returns = {
    {
      name = 'start',
      type = 'number',
      description = [[
        The index of the first vertex that will be drawn, or `nil` if no draw range is set.
      ]]
    },
    {
      name = 'count',
      type = 'number',
      description = [[
        The number of vertices that will be drawn, or `nil` if no draw range is set.
      ]]
    }
  }
}
