return {
  tag = 'graphicsState',
  summary = 'Set the line width.',
  description = 'Sets the width of lines rendered using `lovr.graphics.line`.',
  arguments = {
    {
      name = 'width',
      type = 'number',
      description = 'The new line width, in pixels.'
    }
  },
  returns = {},
  notes = [[
    The default line width is `1.0`.

    Driver support for line widths is poor.  The actual width of lines may be different from what is
    set here.  In particular, some graphics drivers only support a line width of `1.0`.
  ]],
  related = {
    'lovr.graphics.line'
  }
}
