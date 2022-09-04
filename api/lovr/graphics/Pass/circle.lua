return {
  tag = 'drawing',
  summary = 'Draw a circle.',
  description = 'Draws a circle.',
  arguments = {
    {
      name = 'transform',
      type = 'Mat4',
      description = [[
        The transform of the circle.  Can also be provided as position, radius, and rotation, using
        a mix of `Vectors` or numbers.
      ]]
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
  notes = [[
    The local origin of the circle is in its center, and the local z axis goes through the center.
  ]]
}
