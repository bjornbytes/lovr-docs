return {
  summary = 'Create a new mat4.',
  description = [[
    Creates a new `mat4`.

    Note that this function is also a table containing the `__index` key of the mat4 metatable.
    This means that you can add your own functions onto the `lovr.math.mat4` table to extend the
    built-in functionality.
  ]],
  arguments = {
    n = {
      type = 'mat4',
      description = 'An existing matrix to copy the values from.'
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
      description = 'The new matrix.'
    }
  },
  variants = {
    {
      description = 'Sets the matrix to the identity matrix.',
      arguments = {},
      returns = { 'm' }
    },
    {
      description = 'Copies values from an existing matrix.',
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
  notes = 'This function takes the same arguments as `mat4:set`.',
  related = {
    'Pool:mat4',
    'lovr.math.vec3',
    'lovr.math.quat'
  }
}
