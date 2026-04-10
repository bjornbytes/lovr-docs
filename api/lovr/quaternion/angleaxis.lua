return {
  summary = 'Create a quaternion from an angle/axis rotation.',
  description = [[
    Returns a quaternion that rotates `angle` radians around an axis.
  ]],
  arguments = {
    angle = {
      type = 'number',
      description = 'The number of radians the quaternion will rotate around the axis.'
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
  returns = {
    q = {
      type = 'quaternion',
      description = 'The new quaternion.  It will be normalized.'
    }
  },
  variants = {
    {
      arguments = { 'angle', 'ax', 'ay', 'az' },
      returns = { 'q' }
    }
  },
  notes = [[
    The `quaternion` library can be called, which is shorthand for `quaternion.angleaxis`:

        quaternion(angle, ax, ay, az) -- same as quaternion.angleaxis(angle, ax, ay, az)
  ]],
  example = 'local q = quaternion(lovr.headset.getOrientation())`',
  related = {
    'quaternion.toangleaxis'
  }
}
