return {
  summary = 'Get the dimensions of a glyph, or the font.',
  description = [[
    Returns the dimensions of a glyph, or the largest dimensions of any glyph in the font.
  ]],
  arguments = {
    glyph = {
      type = 'string',
      description = 'A character or codepoint.'
    }
  },
  returns = {
    width = {
      type = 'number',
      description = 'The width, in pixels.'
    },
    height = {
      type = 'number',
      description = 'The height, in pixels.'
    }
  },
  variants = {
    {
      arguments = { 'glyph' },
      returns = { 'width', 'height' }
    },
    {
      arguments = {},
      returns = { 'width', 'height' }
    }
  },
  related = {
    'Rasterizer:getWidth',
    'Rasterizer:getHeight',
    'Rasterizer:getBoundingBox'
  }
}
