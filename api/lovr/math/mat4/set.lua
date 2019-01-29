return {
  summary = 'Set the components of the matrix.',
  description = [[
    Sets the components of the matrix from separate position, rotation, and scale arguments or an
    existing matrix.
  ]],
  arguments = {
    n = {
      type = 'mat4',
      description = 'An existing matrix to copy the values from.'
    },
    x = {
      type = 'number',
      description = 'A number to set as the diagonal values of the matrix.'
    },
    position = {
      type = 'vec3',
      default = '0, 0, 0',
      description = 'The translation of the matrix.'
    },
    scale = {
      type = 'vec3',
      default = '1, 1, 1',
      description = 'The scale of the matrix.'
    },
    rotation = {
      type = 'quat',
      default = '0, 0, 0, 0',
      description = 'The rotation of the matrix.'
    },
    ['...'] = {
      type = 'number',
      description = '16 numbers to use as the raw values of the matrix (column-major).'
    }
  },
  returns = {
    m = {
      type = 'mat4',
      description = 'The original matrix.'
    }
  },
  variants = {
    {
      description = 'Resets the matrix to the identity matrix.',
      arguments = {},
      returns = { 'm' }
    },
    {
      description = 'Sets the diagonal values of the matrix equal to a number.',
      arguments = { 'x' },
      returns = { 'm' }
    },
    {
      description = 'Copies the values from an existing matrix.',
      arguments = { 'n' },
      returns = { 'm' }
    },
    {
      arguments = { 'position', 'scale', 'rotation' },
      returns = { 'm' }
    },
    {
      arguments = { '...' },
      returns = { 'm' }
    }
  },
  related = {
    'mat4:unpack'
  }
}
