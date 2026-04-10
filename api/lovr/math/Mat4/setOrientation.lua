return {
  summary = 'Set the orientation of the matrix.',
  description = 'Sets the orientation of the matrix, without changing its position or scale.',
  arguments = {
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
      arguments = { 'angle', 'ax', 'ay', 'az' },
      returns = { 'self' }
    },
    {
      arguments = { 'orientation' },
      returns = { 'self' }
    }
  },
  related = {
    'Mat4:getOrientation',
    'Mat4:setPosition',
    'Mat4:setScale',
    'Mat4:setPose',
    'Mat4:set'
  }
}
