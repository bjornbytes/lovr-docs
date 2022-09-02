return {
  summary = 'Get a Buffer containing the vertices in the Model.',
  description = 'Returns a `Buffer` that holds the vertices of all of the meshes in the Model.',
  arguments = {},
  returns = {
    {
      name = 'buffer',
      type = 'Buffer',
      description = 'The vertex buffer.'
    }
  },
  related = {
    'Model:getIndexBuffer'
  }
}
