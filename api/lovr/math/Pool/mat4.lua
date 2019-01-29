return {
  summary = 'Get a new mat4.',
  description = 'Allocates a new `mat4` from the Pool and returns it.',
  arguments = {
    n = {
      type = 'mat4',
      description = 'An existing matrix to copy the values from.'
    },
    position = {
      type = 'vec3',
      default = '0, 0, 0',
      description = 'The initial translation of the matrix.'
    },
    scale = {
      type = 'vec3',
      default = '1, 1, 1',
      description = 'The initial scale of the matrix.'
    },
    rotation = {
      type = 'quat',
      default = '0, 0, 0, 0',
      description = 'The initial rotation of the matrix.'
    },
    ['...'] = {
      type = 'number',
      description = '16 numbers to use as the raw values of the matrix (column-major).'
    }
  },
  returns = {
    m = {
      type = 'mat4',
      description = 'The new matrix.'
    }
  },
  variants = {
    {
      description = 'Returns an identity matrix.',
      arguments = {},
      returns = { 'm' }
    },
    {
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
    'Pool:vec3',
    'Pool:quat',
    'lovr.math.mat4',
    'mat4'
  }
}
