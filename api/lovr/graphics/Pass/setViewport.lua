return {
  tag = 'pipeline',
  summary = 'Set the viewport.',
  description = 'TODO',
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the upper-left corner of the viewport.',
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the upper-left corner of the viewport.',
    },
    w = {
      type = 'number',
      description = 'The width of the viewport.',
    },
    h = {
      type = 'number',
      description = 'The height of the viewport.',
    },
    minDepth = {
      type = 'number',
      default = '0.0',
      description = 'The min component of the depth range.'
    },
    maxDepth = {
      type = 'number',
      default = '1.0',
      description = 'The max component of the depth range.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'w', 'h', 'minDepth', 'maxDepth' },
      returns = {}
    }
  },
  notes = [[
    TODO floating point, negative, flipped depth range, limits, not pipeline, initial pass state,
    what the hell is depth range
  ]],
  related = {
    'Pass:setScissor'
  }
}
