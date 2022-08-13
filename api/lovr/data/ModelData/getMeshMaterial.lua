return {
  summary = 'Get the index of the material applied to a mesh.',
  description = 'Returns the index of the material applied to a mesh.',
  arguments = {
    {
      name = 'mesh',
      type = 'number',
      description = 'The index of a mesh.'
    }
  },
  returns = {
    {
      name = 'material',
      type = 'number',
      description = [[
        The index of the material applied to the mesh, or nil if the mesh does not have a material.
      ]]
    }
  }
}
