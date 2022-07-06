return {
  tag = 'drawing',
  summary = 'Draw a cube.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The transform to apply to the cube.'
    },
    {
      name = 'style',
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the cube should be drawn filled or outlined.'
    }
  },
  returns = {},
  notes = 'TODO'
}
