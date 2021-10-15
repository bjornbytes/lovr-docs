return {
  summary = 'Set the scissor.',
  description = 'TODO',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x coordinate of the upper-left corner of the scissor rectangle.',
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y coordinate of the upper-left corner of the scissor rectangle.',
    },
    {
      name = 'w',
      type = 'number',
      description = 'The width of the scissor rectangle.',
    },
    {
      name = 'h',
      type = 'number',
      description = 'The height of the scissor rectangle.',
    }
  },
  returns = {},
  notes = [[
    TODO not floating point, negative, limits, not pipeline, initial pass state
  ]],
  related = {
    'lovr.graphics.setViewport'
  }
}
