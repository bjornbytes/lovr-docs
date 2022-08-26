return {
  summary = 'Get the number of materials in the model.',
  description = 'Returns the number of materials in the model.',
  arguments = {},
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of materials in the model.'
    }
  },
  related = {
    'ModelData:getMaterialName',
    'ModelData:getMeshMaterial',
    'ModelData:getMaterial',
    'Model:getMaterialCount'
  }
}
