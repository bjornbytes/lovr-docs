return {
  tag = 'graphicsTransforms',
  summary = 'Scale the coordinate system.',
  description = [[
    Scales the coordinate system in 3 dimensions.  This will cause objects to appear bigger or
    smaller.

    The scaling will last until `lovr.draw` returns or the transformation is popped off the
    transformation stack.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The amount to scale on the x axis.'
    },
    y = {
      type = 'number',
      default = 'x',
      description = 'The amount to scale on the y axis.'
    },
    z = {
      type = 'number',
      default = 'x',
      description = 'The amount to scale on the z axis.'
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
    'lovr.graphics.translate',
    'lovr.graphics.transform'
  }
}
