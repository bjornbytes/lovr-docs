return {
  tag = 'window',
  summary = 'Get capabilities of the graphics card.',
  description = [[
    Returns information about the capabilities of the graphics card, such as the maximum texture
    size or the amount of supported antialiasing.
  ]],
  arguments = {},
  returns = {
    {
      name = 'limits',
      type = 'table',
      description = 'The table of limits.',
      table = {
        {
          name = 'pointsize',
          type = 'number',
          description = 'The maximum size of points, in pixels.'
        },
        {
          name = 'texturesize',
          type = 'number',
          description = 'The maximum width or height of textures, in pixels.'
        },
        {
          name = 'texturemsaa',
          type = 'number',
          description = 'The maximum MSAA value supported by `lovr.graphics.newTexture`.'
        },
        {
          name = 'anisotropy',
          type = 'number',
          description = 'The maximum anisotropy value supported by `Texture:setFilter`.'
        }
      }
    }
  },
  related = {
    'lovr.graphics.getSupported'
  }
}
