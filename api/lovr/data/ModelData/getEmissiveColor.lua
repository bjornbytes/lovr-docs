return {
  summary = 'Get the emissive color of a material in the ModelData.',
  description = 'Returns the emissive color of a material in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the material.'
    }
  },
  returns = {
    {
      name = 'r',
      type = 'number',
      description = 'The red channel of the emissive color, from 0.0 to 1.0.'
    },
    {
      name = 'g',
      type = 'number',
      description = 'The green channel of the emissive color, from 0.0 to 1.0.'
    },
    {
      name = 'b',
      type = 'number',
      description = 'The blue channel of the emissive color, from 0.0 to 1.0.'
    },
    {
      name = 'a',
      type = 'number',
      description = 'The alpha channel of the emissive color, from 0.0 to 1.0.'
    }
  },
  related = {
    'ModelData:getEmissiveTexture',
    'ModelData:getDiffuseColor',
    'Material:getColor',
    'MaterialColor'
  }
}
