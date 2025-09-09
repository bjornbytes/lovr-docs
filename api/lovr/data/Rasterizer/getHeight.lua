return {
  summary = 'Get the height of a glyph, or the font.',
  description = 'Returns the height of a glyph, or the maximum height of any glyph in the font.',
  arguments = {
    glyph = {
      type = 'string | number',
      description = 'A character or codepoint.'
    }
  },
  returns = {
    height = {
      type = 'number',
      description = 'The height, in pixels.'
    }
  },
  variants = {
    {
      arguments = { 'glyph' },
      returns = { 'height' }
    },
    {
      arguments = {},
      returns = { 'height' }
    }
  },
  related = {
    'Rasterizer:getWidth',
    'Rasterizer:getDimensions',
    'Rasterizer:getBoundingBox'
  }
}
