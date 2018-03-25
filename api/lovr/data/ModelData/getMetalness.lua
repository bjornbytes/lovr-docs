return {
  summary = 'Get the metalness factor of a material in the ModelData.',
  description = 'Returns the metalness factor of a material in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the material.'
    }
  },
  returns = {
    {
      name = 'metalness',
      type = 'number',
      description = 'The metalness factor for the material, from 0.0 to 1.0.'
    }
  },
  related = {
    'ModelData:getMetalnessTexture',
    'ModelData:getRoughness',
    'Material:getScalar',
    'MaterialScalar'
  }
}
