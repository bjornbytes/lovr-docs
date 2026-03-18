return {
  summary = 'Get the pose of the AudioMesh.',
  description = 'Returns the position and orientation of the AudioMesh.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x position of the AudioMesh, in meters.'
    },
    y = {
      type = 'number',
      description = 'The y position of the AudioMesh, in meters.'
    },
    z = {
      type = 'number',
      description = 'The z position of the AudioMesh, in meters.'
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
      returns = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'AudioMesh:getPosition',
    'AudioMesh:getOrientation',
    'AudioMesh:getScale',
    'AudioMesh:getTransform'
  }
}
