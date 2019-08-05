return {
  summary = 'Create a new vec3.',
  description = [[
    Creates a new `vec3`.

    Note that this function is also a table containing the `__index` key of the vec3 metatable.
    This means that you can add your own functions onto the `lovr.math.vec3` table to extend the
    built-in functionality.
  ]],
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x value of the vector.'
    },
    y = {
      type = 'number',
      default = 'x',
      description = 'The y value of the vector.'
    },
    z = {
      type = 'number',
      default = 'x',
      description = 'The z value of the vector.'
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
      arguments = { 'x', 'y', 'z' },
      returns = { 'v' }
    },
    {
      arguments = { 'u' },
      returns = { 'v' }
    }
  },
  notes = 'This function takes the same arguments as `vec3:set`.',
  related = {
    'lovr.math.quat',
    'lovr.math.mat4'
  }
}
