return {
  tag = 'graphicsPrimitives',
  summary = 'Draw a triangle.',
  description = 'Draws a triangle from three points.',
  arguments = {
    mode = {
      type = 'DrawMode',
      description = 'How to draw the triangle.'
    },
    material = {
      type = 'Material',
      description = 'The Material to apply.'
    },
    x1 = {
      type = 'number',
      description = 'The x coordinate of the first point.'
    },
    y1 = {
      type = 'number',
      description = 'The y coordinate of the first point.'
    },
    z1 = {
      type = 'number',
      description = 'The z coordinate of the first point.'
    },
    x2 = {
      type = 'number',
      description = 'The x coordinate of the second point.'
    },
    y2 = {
      type = 'number',
      description = 'The y coordinate of the second point.'
    },
    z2 = {
      type = 'number',
      description = 'The z coordinate of the second point.'
    },
    x3 = {
      type = 'number',
      description = 'The x coordinate of the third point.'
    },
    y3 = {
      type = 'number',
      description = 'The y coordinate of the third point.'
    },
    z3 = {
      type = 'number',
      description = 'The z coordinate of the third point.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode', 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', 'x3', 'y3', 'z3' },
      returns = {}
    },
    {
      arguments = { 'material', 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', 'x3', 'y3', 'z3' },
      returns = {}
    }
  },
  notes = 'Unlike some of the other primitives, exactly 3 points are required here.'
}
