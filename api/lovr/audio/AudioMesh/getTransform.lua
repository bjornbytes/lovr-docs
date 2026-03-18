return {
  summary = 'Get the transform of the AudioMesh.',
  description = 'Returns transform (position, scale, and orientation) of the AudioMesh.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x position, in meters.'
    },
    y = {
      type = 'number',
      description = 'The y position, in meters.'
    },
    z = {
      type = 'number',
      description = 'The z position, in meters.'
    },
    sx = {
      type = 'number',
      description = 'The x scale.'
    },
    sy = {
      type = 'number',
      description = 'The y scale.'
    },
    sz = {
      type = 'number',
      description = 'The z scale.'
    },
    angle = {
      type = 'number',
      description = 'The number of radians the AudioMesh is rotated around its axis of rotation.'
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
      arguments = {},
      returns = { 'x', 'y', 'z', 'sx', 'sy', 'sz', 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'AudioMesh:getPosition',
    'AudioMesh:getOrientation',
    'AudioMesh:getPose',
    'AudioMesh:getScale'
  }
}
