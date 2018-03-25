return {
  summary = 'Get the emissive texture of a material in the ModelData.',
  description = 'Returns the emissive texture of a material in the ModelData.',
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
      description = 'The emissive texture data.'
    }
  },
  related = {
    'ModelData:getEmissiveColor',
    'Material:getTexture',
    'MaterialTexture'
  }
}
