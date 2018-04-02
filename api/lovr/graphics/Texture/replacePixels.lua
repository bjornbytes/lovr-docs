return {
  summary = 'Replace pixels in the Texture using a TextureData object.',
  description = 'Replaces pixels in the Texture, sourcing from a `TextureData` object.',
  arguments = {
    {
      name = 'textureData',
      type = 'TextureData',
      description = [[
        The TextureData containing the pixels to use.  Currently, the TextureData needs to have the
        same dimensions as the source Texture.
      ]]
    },
    {
      name = 'slice',
      type = 'number',
      default = '1',
      description = 'The slice to replace.  Not applicable for 2D textures.'
    }
  },
  returns = {},
  related = {
    'TextureData:setPixel',
    'TextureData'
  }
}
