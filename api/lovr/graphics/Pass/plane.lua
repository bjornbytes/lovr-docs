return {
  tag = 'drawing',
  summary = 'Draw a flat plane.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'Transform2',
      description = 'The transform to apply to the plane.'
    },
    {
      name = 'style',
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the plane should be drawn filled or outlined.'
    },
    {
      name = 'columns',
      type = 'number',
      default = '1',
      description = 'The number of horizontal segments in the plane.'
    },
    {
      name = 'rows',
      type = 'number',
      default = 'cols',
      description = 'The number of vertical segments in the plane.'
    }
  },
  returns = {},
  notes = 'TODO'
}
