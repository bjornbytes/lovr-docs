return {
  summary = 'Set the translation of the matrix.',
  description = 'Sets the translation of the matrix, without changing its rotation or scale.',
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
    position = {
      type = 'vector',
      description = 'The new position.'
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
      arguments = { 'x', 'y', 'z' },
      returns = { 'self' }
    },
    {
      arguments = { 'position' },
      returns = { 'self' }
    }
  },
  related = {
    'Mat4:getPosition',
    'Mat4:setOrientation',
    'Mat4:setScale',
    'Mat4:setPose',
    'Mat4:set'
  }
}
