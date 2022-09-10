return {
  tag = 'pipeline',
  summary = 'Set the scissor.',
  description = 'TODO',
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the upper-left corner of the scissor rectangle.',
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the upper-left corner of the scissor rectangle.',
    },
    w = {
      type = 'number',
      description = 'The width of the scissor rectangle.',
    },
    h = {
      type = 'number',
      description = 'The height of the scissor rectangle.',
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'w', 'h' },
      returns = {}
    }
  },
  notes = [[
    TODO not floating point, negative, limits, not pipeline, initial pass state
  ]],
  related = {
    'Pass:setViewport'
  }
}
