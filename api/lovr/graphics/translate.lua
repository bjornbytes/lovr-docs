return {
  tag = 'graphicsTransforms',
  summary = 'Translate the coordinate system.',
  description = [[
    Translates the coordinate system in three dimensions.  All graphics operations that use
    coordinates will behave as if they are offset by the translation value.

    The translation will last until `lovr.draw` returns or the transformation is popped off the
    transformation stack.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The amount to translate on the x axis.'
    },
    y = {
      type = 'number',
      description = 'The amount to translate on the y axis.'
    },
    z = {
      type = 'number',
      description = 'The amount to translate on the z axis.'
    },
    matrix = {
      type = 'MatrixType',
      default = [['model']],
      description = 'The matrix to modify.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'matrix', 'x', 'y', 'z' },
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
