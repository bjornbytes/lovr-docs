return {
  summary = 'Get angle between this and another vector.',
  description = 'Returns the angle between vectors.',
  arguments = {
    u = {
      type = 'Vec2',
      description = 'The other vector.'
    },
    x = {
      type = 'number',
      description = 'A value of x component of other vector.'
    },
    y = {
      type = 'number',
      description = 'A value of y component of other vector.'
    }
  },
  returns = {
    angle = {
      type = 'number',
      description = 'The angle to other vector, in radians.'
    },
  },
  variants = {
    {
      arguments = { 'u' },
      returns = { 'angle' }
    },
    {
      arguments = { 'x', 'y' },
      returns = { 'angle' }
    }
  },
  notes = [[
    If any of two vectors has length of zero, the angle between them is not
    well defined. In this case the function returns `math.pi / 2` angle.
  ]],
  related = {
    'Vec2:distance',
    'Vec2:length'
  }
}
