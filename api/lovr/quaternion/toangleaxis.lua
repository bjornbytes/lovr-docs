return {
  summary = 'Convert a quaternion to angle/axis representation.',
  description = 'Returns the angle/axis representation of the quaternion, as 4 numbers.',
  arguments = {
    q = {
      type = 'quaternion',
      description = 'The quaternion.'
    }
  },
  returns = {
    angle = {
      type = 'number',
      description = 'The number of radians the quaternion rotates around the axis of rotation.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  variants = {
    {
      arguments = { 'q' },
      returns = { 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'quaternion.angleaxis'
  }
}
