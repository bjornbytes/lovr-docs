return {
  summary = 'Scale the coordinate system.',
  description = 'TODO',
  arguments = {
    x = {
      type = 'number',
      default = '1',
      description = 'The amount to scale the x axis.'
    },
    y = {
      type = 'number',
      default = '1',
      description = 'The amount to scale the y axis.'
    },
    z = {
      type = 'number',
      default = '1',
      description = 'The amount to scale the z axis.'
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
  related = {
    'lovr.graphics.translate',
    'lovr.graphics.rotate',
    'lovr.graphics.transform'
  }
}
