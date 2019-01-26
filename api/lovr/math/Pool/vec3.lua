return {
  summary = 'Get a new vec3.',
  description = 'Allocates a new `vec3` from the Pool and returns it.',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x component of the vector.'
    },
    y = {
      type = 'number',
      default = 'x',
      description = 'The y component of the vector.'
    },
    z = {
      type = 'number',
      default = 'x',
      description = 'The z component of the vector.'
    },
    u = {
      type = 'vec3',
      description = 'The vector to copy the values from.'
    }
  },
  returns = {
    v = {
      type = 'vec3',
      description = 'The new vector.'
    }
  },
  variants = {
    {
      description = 'Fills the vector with `0`.',
      arguments = {},
      returns = { 'v' }
    },
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'v' }
    },
    {
      arguments = { 'u' },
      returns = { 'v' }
    }
  },
  related = {
    'Pool:quat',
    'Pool:mat4',
    'lovr.math.vec3',
    'vec3'
  }
}
