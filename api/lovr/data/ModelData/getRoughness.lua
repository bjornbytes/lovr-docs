return {
  summary = 'Get the roughness factor of a material in the ModelData.',
  description = 'Returns the roughness factor of a material in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the material.'
    }
  },
  returns = {
    {
      name = 'roughness',
      type = 'number',
      description = 'The roughness factor for the material, from 0.0 to 1.0.'
    }
  },
  related = {
    'ModelData:getMetalness',
    'ModelData:getRoughnessTexture',
    'Material:getScalar',
    'MaterialScalar'
  }
}
