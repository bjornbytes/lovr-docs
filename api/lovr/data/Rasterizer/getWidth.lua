return {
  summary = 'Get the width of a glyph, or the font.',
  description = 'Returns the width of a glyph, or the maximum width of any glyph in the font.',
  arguments = {
    glyph = {
      type = 'string | number',
      description = 'A character or codepoint.'
    }
  },
  returns = {
    width = {
      type = 'number',
      description = 'The width, in pixels.'
    }
  },
  variants = {
    {
      arguments = { 'glyph' },
      returns = { 'width' }
    },
    {
      arguments = {},
      returns = { 'width' }
    }
  },
  related = {
    'Rasterizer:getHeight',
    'Rasterizer:getDimensions',
    'Rasterizer:getBoundingBox'
  }
}
