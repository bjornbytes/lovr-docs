return {
  summary = 'Get a triangle in the ModelData.',
  description = 'Returns a single triangle in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the triangle to get.'
    }
  },
  returns = {
    {
      name = 'i',
      type = 'number',
      description = 'The index of the first vertex in the triangle.'
    },
    {
      name = 'j',
      type = 'number',
      description = 'The index of the second vertex in the triangle.'
    },
    {
      name = 'k',
      type = 'number',
      description = 'The index of the third vertex in the triangle.'
    }
  },
  related = {
    'ModelData:getTriangleCount'
  }
}
