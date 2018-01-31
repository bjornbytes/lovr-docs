return {
  summary = 'Get the current vertex map of the Mesh.',
  description = [[
    Returns the current vertex map for the Mesh.  The vertex map is a list of indices in the Mesh,
    allowing the reordering or reuse of vertices.
  ]],
  arguments = {},
  returns = {
    {
      name = 'map',
      type = 'table',
      description = 'The list of indices in the vertex map, or `nil` if no vertex map is set.'
    }
  }
}
