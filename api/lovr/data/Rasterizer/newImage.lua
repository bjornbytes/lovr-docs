return {
  summary = 'Get an Image of a rasterized glyph.',
  description = 'Returns an `Image` containing a rasterized glyph.',
  arguments = {
    glyph = {
      type = 'string | number',
      description = 'A character or codepoint to rasterize.'
    },
    spread = {
      type = 'number',
      default = '4.0',
      description = 'The width of the distance field, for signed distance field rasterization.'
    },
    padding = {
      type = 'number',
      default = 'spread / 2',
      description = 'The number of pixels of padding to add at the edges of the image.'
    }
  },
  returns = {
    image = {
      type = 'Image',
      description = 'The glyph image.  It will be in the `rgba32f` format.'
    }
  },
  variants = {
    {
      arguments = { 'glyph', 'spread', 'padding' },
      returns = { 'image' }
    }
  },
  related = {
    'Rasterizer:getCurves'
  }
}
