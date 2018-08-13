return {
  summary = 'Get the transformation applied to texture coordinates.',
  description = 'Returns the transformation applied to texture coordinates of the Material.',
  arguments = {},
  returns = {
    {
      name = 'ox',
      type = 'number',
      description = 'The texture coordinate x offset.'
    },
    {
      name = 'oy',
      type = 'number',
      description = 'The texture coordinate y offset.'
    },
    {
      name = 'sx',
      type = 'number',
      description = 'The texture coordinate x scale.'
    },
    {
      name = 'sy',
      type = 'number',
      description = 'The texture coordinate y scale.'
    },
    {
      name = 'angle',
      type = 'number',
      description = 'The texture coordinate rotation, in radians.'
    }
  }
}
