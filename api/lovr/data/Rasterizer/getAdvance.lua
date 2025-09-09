return {
  summary = 'Get the advance of a glyph.',
  description = [[
    Returns the advance metric for a glyph, in pixels.  The advance is the horizontal distance to
    advance the cursor after rendering the glyph.
  ]],
  arguments = {
    glyph = {
      type = 'string | number',
      description = 'A character or codepoint.'
    }
  },
  returns = {
    advance = {
      type = 'number',
      description = 'The advance of the glyph, in pixels.'
    }
  },
  variants = {
    {
      arguments = { 'glyph' },
      returns = { 'advance' }
    }
  },
  example = [[
    local rasterizer = lovr.data.newRasterizer()
    local advance1 = rasterizer:getAdvance('H') + rasterizer:getAdvance('i')
    local advance2 = rasterizer:getAdvance(72) + rasterizer:getAdvance(105)
    assert(advance1 == advance2)
  ]]
}
