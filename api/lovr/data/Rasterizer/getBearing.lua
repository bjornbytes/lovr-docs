return {
  summary = 'Get the bearing of a glyph.',
  description = [[
    Returns the bearing metric for a glyph, in pixels.  The bearing is the horizontal distance from
    the cursor to the edge of the glyph.
  ]],
  arguments = {
    glyph = {
      type = 'string | number',
      description = 'A character or codepoint.'
    }
  },
  returns = {
    bearing = {
      type = 'number',
      description = 'The bearing of the glyph, in pixels.'
    }
  },
  variants = {
    {
      arguments = { 'glyph' },
      returns = { 'bearing' }
    }
  },
  example = [[
    local rasterizer = lovr.data.newRasterizer()

    -- In the default font, H is wider than i
    assert(rasterizer:getBearing('H') > rasterizer:getBearing('i'))
  ]]
}
