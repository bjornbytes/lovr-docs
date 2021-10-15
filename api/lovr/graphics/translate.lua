return {
  summary = 'Translate the coordinate system.',
  description = [[
    Applies a translation to the coordinate space.  All objects drawn will have their position
    offset by this value.

    The effect will last until the active pass is finished or the transformation is popped off the
    stack using `lovr.graphics.pop`.
  ]],
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The amount to translate on the x axis.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The amount to translate on the y axis.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The amount to translate on the z axis.'
    },
    v = {
      type = 'Vec3',
      description = 'A vector to translate by.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'v' },
      returns = {}
    }
  },
  notes = 'Order matters when scaling, translating, and rotating the coordinate system.',
  related = {
    'lovr.graphics.rotate',
    'lovr.graphics.scale',
    'lovr.graphics.transform'
  }
}
