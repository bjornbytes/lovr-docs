return {
  tag = 'transform',
  summary = 'Translate the coordinate system.',
  description = 'TODO',
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
    'Pass:rotate',
    'Pass:scale',
    'Pass:transform'
  }
}
