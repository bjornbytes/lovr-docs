return {
  summary = 'Get the number of mipmap levels in the Texture.',
  description = [[
    Returns the number of mipmap levels in the Texture.  This is set when the Texture is created.
    By default, textures are created with a full set of mipmap levels, and mipmaps are generated if
    the images used to create the texture do not include mipmaps.
  ]],
  arguments = {},
  returns = {
    {
      name = 'mipmaps',
      type = 'number',
      description = 'The number of mipmap levels in the Texture.'
    }
  },
  notes = [[
    Each mipmap level will be half the size of the previous (larger) mipmap level, down to a single
    pixel.  This means the maximum number of mipmap levels is given by `log2(max(width, height))`
    for non-3D textures and `log2(max(width, height, depth))` for 3D textures.
  ]],
  related = {
    'lovr.graphics.newTexture',
    'Pass:mipmap'
  }
}
