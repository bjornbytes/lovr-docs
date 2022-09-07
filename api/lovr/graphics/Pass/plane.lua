return {
  tag = 'drawing',
  summary = 'Draw a flat plane.',
  description = 'TODO',
  arguments = {
    transform = {
      type = 'Transform2',
      description = 'The transform to apply to the plane.'
    },
    style = {
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the plane should be drawn filled or outlined.'
    },
    columns = {
      type = 'number',
      default = '1',
      description = 'The number of horizontal segments in the plane.'
    },
    rows = {
      type = 'number',
      default = 'cols',
      description = 'The number of vertical segments in the plane.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'transform', 'style', 'columns', 'rows' },
      returns = {}
    }
  },
  notes = 'TODO'
}
