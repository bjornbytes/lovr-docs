return {
  summary = 'Get the roughness texture of a material in the ModelData.',
  description = 'Returns the roughness texture of a material in the ModelData.',
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
      description = 'The roughness texture data.'
    }
  },
  related = {
    'ModelData:getRoughness',
    'ModelData:getMetalnessTexture',
    'Material:getTexture',
    'MaterialTexture'
  }
}
