return {
  summary = 'Rotate the coordinate system.',
  description = 'TODO',
  arguments = {
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
    q = {
      type = 'Quat',
      description = 'A quaternion containing the rotation to apply.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'q' },
      returns = {}
    }
  },
  notes = [[
    TODO axis does not need to be normalized
    TODO order matters
  ]],
  related = {
    'lovr.graphics.translate',
    'lovr.graphics.scale',
    'lovr.graphics.transform'
  }
}
