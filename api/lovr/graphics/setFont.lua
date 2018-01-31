return {
  tag = 'graphicsState',
  summary = 'Set the active font.',
  description = 'Sets the active font used to render text with `lovr.graphics.print`.',
  arguments = {
    {
      name = 'font',
      type = 'Font',
      description = 'The font to use.'
    }
  },
  returns = {},
  related = {
    'lovr.graphics.print'
  }
}
