return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a triangle.',
  description = 'Draws a triangle from three points.',
  arguments = {
    {
      name = 'mode',
      type = 'DrawMode',
      description = 'How to draw the triangle.'
    },
    {
      name = 'x1',
      type = 'number',
      description = 'The x coordinate of the first point.'
    },
    {
      name = 'y1',
      type = 'number',
      description = 'The y coordinate of the first point.'
    },
    {
      name = 'z1',
      type = 'number',
      description = 'The z coordinate of the first point.'
    },
    {
      name = 'x2',
      type = 'number',
      description = 'The x coordinate of the second point.'
    },
    {
      name = 'y2',
      type = 'number',
      description = 'The y coordinate of the second point.'
    },
    {
      name = 'z2',
      type = 'number',
      description = 'The z coordinate of the second point.'
    },
    {
      name = 'x3',
      type = 'number',
      description = 'The x coordinate of the third point.'
    },
    {
      name = 'y3',
      type = 'number',
      description = 'The y coordinate of the third point.'
    },
    {
      name = 'z3',
      type = 'number',
      description = 'The z coordinate of the third point.'
    }
  },
  returns = {},
  notes = 'Unlike some of the other primitives, exactly 3 points are required here.'
}
