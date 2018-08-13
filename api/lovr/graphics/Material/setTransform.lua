return {
  summary = 'Set the transformation applied to texture coordinates.',
  description = [[
    Sets the transformation applied to texture coordinates of the Material.  This lets you offset,
    scale, or rotate textures as they are applied to geometry.
  ]],
  arguments = {
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
  },
  returns = {}
}
