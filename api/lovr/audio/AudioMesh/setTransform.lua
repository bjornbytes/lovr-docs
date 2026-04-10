return {
  summary = 'Set the transform of the AudioMesh.',
  description = 'Sets the transform of the AudioMesh.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the position.'
    },
    y = {
      type = 'number',
      description = 'The y component of the position.'
    },
    z = {
      type = 'number',
      description = 'The z component of the position.'
    },
    sx = {
      type = 'number',
      description = 'The x component of the scale.'
    },
    sy = {
      type = 'number',
      description = 'The y component of the scale.'
    },
    sz = {
      type = 'number',
      description = 'The z component of the scale.'
    },
    angle = {
      type = 'number',
      description = [[
        The number of radians the AudioMesh should be rotated around its rotation axis.
      ]]
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
    scale = {
      type = 'vector',
      description = 'The scale.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The orientation.'
    },
    transform = {
      type = 'Mat4',
      description = 'The transform.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the transform using numbers.',
      arguments = { 'x', 'y', 'z', 'sx', 'sy', 'sz', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      description = 'Set the transform using vectors.',
      arguments = { 'position', 'scale', 'orientation' },
      returns = {}
    },
    {
      description = 'Set the transform using a matrix.',
      arguments = { 'transform' },
      returns = {}
    }
  },
  related = {
    'AudioMesh:setPosition',
    'AudioMesh:setOrientation',
    'AudioMesh:setPose',
    'AudioMesh:setScale'
  }
}
