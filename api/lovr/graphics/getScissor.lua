return {
  tag = 'graphicsState',
  summary = 'Get the scissor rectangle.',
  description = [[
    Returns the current scissor.  The scissor is a rectangular area of the screen.  Any pixels
    outside the scissor region will be unaffected by drawing operations.
  ]],
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the upper left corner of the scissor.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position of the upper left corner of the scissor.'
    },
    {
      name = 'w',
      type = 'number',
      description = 'The width of the scissor in pixels.'
    },
    {
      name = 'h',
      type = 'number',
      description = 'The height of the scissor in pixels.'
    }
  }
}
