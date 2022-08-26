return {
  tag = 'pipeline',
  summary = 'Set the viewport.',
  description = 'TODO',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x coordinate of the upper-left corner of the viewport.',
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y coordinate of the upper-left corner of the viewport.',
    },
    {
      name = 'w',
      type = 'number',
      description = 'The width of the viewport.',
    },
    {
      name = 'h',
      type = 'number',
      description = 'The height of the viewport.',
    },
    {
      name = 'minDepth',
      type = 'number',
      default = '0.0',
      description = 'The min component of the depth range.'
    },
    {
      name = 'maxDepth',
      type = 'number',
      default = '1.0',
      description = 'The max component of the depth range.'
    }
  },
  returns = {},
  notes = [[
    TODO floating point, negative, flipped depth range, limits, not pipeline, initial pass state,
    what the hell is depth range
  ]],
  related = {
    'lovr.graphics.setScissor'
  }
}
