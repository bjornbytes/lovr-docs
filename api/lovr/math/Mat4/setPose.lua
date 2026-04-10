return {
  summary = 'Set the position and rotation of the matrix.',
  description = 'Sets the position and rotation of the matrix, without changing its scale.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x translation.'
    },
    y = {
      type = 'number',
      description = 'The y translation.'
    },
    z = {
      type = 'number',
      description = 'The z translation.'
    },
    angle = {
      type = 'number',
      description = 'The number of radians the matrix should be rotated around its rotation axis.'
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
      description = 'The new position.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The new orientation.'
    }
  },
  returns = {
    self = {
      type = 'Mat4',
      description = 'The modified input matrix.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' },
      returns = { 'self' }
    },
    {
      arguments = { 'position', 'orientation' },
      returns = { 'self' }
    }
  },
  related = {
    'Mat4:getPose',
    'Mat4:setPosition',
    'Mat4:setOrientation',
    'Mat4:setScale',
    'Mat4:set'
  }
}
