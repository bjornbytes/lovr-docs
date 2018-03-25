return {
  summary = 'Get the occlusion texture of a material in the ModelData.',
  description = 'Returns the occlusion texture of a material in the ModelData.',
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
      description = 'The occlusion texture data.'
    }
  },
  related = {
    'Material:getTexture',
    'MaterialTexture'
  }
}
