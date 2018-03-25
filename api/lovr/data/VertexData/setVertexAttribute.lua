return {
  summary = 'Update a specific attribute of a single vertex in the VertexData.',
  description = 'Set the components of a specific attribute of a vertex in the VertexData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the vertex to update.'
    },
    {
      name = 'attribute',
      type = 'number',
      description = 'The index of the attribute to update.'
    },
    {
      name = '...',
      type = 'number',
      description = 'Thew new components for the attribute.'
    }
  },
  returns = {}
}
