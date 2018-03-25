return {
  summary = 'Get the normal texture of a material in the ModelData.',
  description = 'Returns the normal texture of a material in the ModelData.',
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
      description = 'The normal texture data.'
    }
  },
  related = {
    'Material:getTexture',
    'MaterialTexture'
  }
}
