return {
  summary = 'Get the height of the font.',
  description = 'Returns the height metric of the font, in pixels.',
  arguments = {},
  returns = {
    height = {
      type = 'number',
      description = 'The height of the font, in pixels.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'height' }
    }
  },
  related = {
    'Font:getHeight'
  }
}
