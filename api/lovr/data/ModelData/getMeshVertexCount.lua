return {
  summary = 'Get the number of vertices in a mesh.',
  description = 'Returns the number of vertices in a mesh.',
  arguments = {
    {
      name = 'mesh',
      type = 'number',
      description = 'The index of a mesh.'
    }
  },
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of vertices in the mesh.'
    }
  },
  related = {
    'ModelData:getMeshIndexCount'
  }
}
