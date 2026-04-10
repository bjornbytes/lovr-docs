return {
  summary = 'Set the scale of the matrix.',
  description = 'Sets the scale of the matrix, without changing its position or rotation.',
  arguments = {
    sx = {
      type = 'number',
      default = '1',
      description = 'The new x scale.'
    },
    sy = {
      type = 'number',
      default = 'sx',
      description = 'The new y scale.'
    },
    sz = {
      type = 'number',
      default = 'sx',
      description = 'The new z scale.'
    },
    scale = {
      type = 'vector',
      description = 'The new scale.'
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
      arguments = { 'sx', 'sy', 'sz' },
      returns = { 'self' }
    },
    {
      arguments = { 'scale' },
      returns = { 'self' }
    }
  },
  related = {
    'Mat4:getScale',
    'Mat4:setPosition',
    'Mat4:setOrientation',
    'Mat4:setPose',
    'Mat4:set'
  }
}
