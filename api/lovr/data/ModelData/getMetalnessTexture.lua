return {
  summary = 'Get the metalness texture of a material in the ModelData.',
  description = 'Returns the metalness texture of a material in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the material.'
    }
  },
  returns = {
    {
      name = 'texture',
      type = 'TextureData',
      description = 'The metalness texture data.'
    }
  },
  related = {
    'ModelData:getMetalness',
    'ModelData:getRoughnessTexture',
    'Material:getTexture',
    'MaterialTexture'
  }
}
