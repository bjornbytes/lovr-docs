return {
  tag = 'drawing',
  summary = 'Draw a box.',
  description = [[
    Draw a box.  This is like `Pass:cube`, except it takes 3 separate values for the scale.
  ]],
  arguments = {
    {
      name = 'transform',
      type = 'Mat4',
      description = [[
        The transform of the box.  Can also be provided as position, scale, and rotation using a mix
        of `Vectors` or numbers.  When using numbers for the scale, 3 numbers are used.
      ]]
    },
    {
      name = 'style',
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the box should be drawn filled or outlined.'
    }
  },
  returns = {},
  related = {
    'Pass:cube'
  }
}
