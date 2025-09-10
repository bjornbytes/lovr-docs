return {
  tag = 'drawing',
  summary = 'Draw a line.',
  description = [[
    Draws a line between points.  `Pass:mesh` can also be used to draw line segments using the
    `line` `DrawMode`.
  ]],
  arguments = {
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
      description = 'The x coordinate of the next point.'
    },
    y2 = {
      type = 'number',
      description = 'The y coordinate of the next point.'
    },
    z2 = {
      type = 'number',
      description = 'The z coordinate of the next point.'
    },
    t = {
      type = '{number | Vec3}',
      description = [[
        A table of numbers or `Vec3` objects (not a mix) representing points of the line.
      ]]
    },
    v1 = {
      type = 'Vec3',
      description = 'A vector containing the position of the first point of the line.'
    },
    v2 = {
      type = 'Vec3',
      description = 'A vector containing the position of the next point on the line.'
    },
    ['...numbers'] = {
      type = 'number',
      description = 'More points to add to the line.'
    },
    ['...vectors'] = {
      type = 'Vec3',
      description = 'More points to add to the line.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', '...numbers' },
      returns = {}
    },
    {
      arguments = { 't' },
      returns = {}
    },
    {
      arguments = { 'v1', 'v2', '...vectors' },
      returns = {}
    }
  },
  notes = 'There is currently no way to increase line thickness.'
}
