return {
  summary = 'Get the line height of the font.',
  description = [[
    Returns the line height metric of the font, in pixels.  This is how far apart lines are.
  ]],
  arguments = {},
  returns = {
    height = {
      type = 'number',
      description = 'The line height of the font, in pixels.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'height' }
    }
  },
  related = {
    'Rasterizer:getHeight',
    'Font:getLineHeight',
    'Font:setLineHeight'
  }
}
