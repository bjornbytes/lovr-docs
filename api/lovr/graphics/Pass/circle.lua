return {
  tag = 'drawing',
  summary = 'Draw a circle.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The transform to apply to the circle.'
    },
    {
      name = 'style',
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the circle should be filled or outlined.'
    },
    {
      name = 'angle1',
      type = 'number',
      default = '0',
      description = 'The angle of the beginning of the arc.'
    },
    {
      name = 'angle2',
      type = 'number',
      default = '2 * math.pi',
      description = 'angle of the end of the arc.'
    },
    {
      name = 'segments',
      type = 'number',
      default = '64',
      description = 'The number of segments to render.'
    }
  },
  returns = {},
  notes = 'TODO'
}
