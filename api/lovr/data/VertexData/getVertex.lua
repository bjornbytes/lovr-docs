return {
  summary = 'Get a single vertex from the VertexData.',
  description = [[
    Gets the data for a single vertex in the VertexData.  The set of data returned depends on the
    vertex format.
  ]],
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the vertex to retrieve, starting at 1 for the first vertex.'
    }
  },
  returns = {
    {
      name = '...',
      type = 'numbers',
      description = 'All attributes of the vertex.'
    }
  }
}
