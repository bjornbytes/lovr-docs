return {
  tag = 'drawing',
  summary = 'Draw a box.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'Transform3',
      description = 'The transform to apply to the box.'
    },
    {
      name = 'style',
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the box should be drawn filled or outlined.'
    }
  },
  returns = {},
  notes = 'TODO'
}
