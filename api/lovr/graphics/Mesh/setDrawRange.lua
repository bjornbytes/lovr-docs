return {
  summary = 'Set the draw range of the Mesh.',
  description = [[
    Set the draw range for the Mesh.  The draw range is a subset of the vertices of the Mesh that
    will be drawn.
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
