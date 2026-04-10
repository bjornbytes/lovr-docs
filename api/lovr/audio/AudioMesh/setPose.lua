return {
  summary = 'Set the pose of the AudioMesh.',
  description = 'Sets the position and orientation of the AudioMesh.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x position of the AudioMesh.'
    },
    y = {
      type = 'number',
      description = 'The y position of the AudioMesh.'
    },
    z = {
      type = 'number',
      description = 'The z position of the AudioMesh.'
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
    },
    position = {
      type = 'vector',
      description = 'The position.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The orientation.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the pose using numbers.',
      arguments = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      description = 'Set the pose using vector types.',
      arguments = { 'position', 'orientation' },
      returns = {}
    }
  },
  related = {
    'AudioMesh:setPosition',
    'AudioMesh:setOrientation',
    'AudioMesh:setScale',
    'AudioMesh:setTransform'
  }
}
