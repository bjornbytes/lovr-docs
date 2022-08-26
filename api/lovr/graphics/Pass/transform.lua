return {
  tag = 'transform',
  summary = 'Apply a general transform to the coordinate system.',
  description = 'TODO',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x component of the translation.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y component of the translation.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z component of the translation.'
    },
    sx = {
      type = 'number',
      default = '1',
      description = 'The x scale factor.'
    },
    sy = {
      type = 'number',
      default = '1',
      description = 'The y scale factor.'
    },
    sz = {
      type = 'number',
      default = '1',
      description = 'The z scale factor.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The number of radians to rotate around the axis of rotation.'
    },
    ax = {
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      default = '1',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    },
    transform = {
      type = 'Mat4',
      description = 'The matrix holding the transform to apply.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'sx', 'sy', 'sz', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'transform' },
      returns = {}
    }
  },
  notes = [[
    TODO you can use combos of numbers/vectors/quats too (or use meta Transform type to explain)
  ]],
  related = {
    'lovr.graphics.translate',
    'lovr.graphics.rotate',
    'lovr.graphics.scale'
  }
}
