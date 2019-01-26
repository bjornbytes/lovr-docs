return {
  summary = 'Create a new Pool.',
  description = [[
    Creates a new `Pool`, used for allocating vector and matrix objects efficiently.

    Note that `lovr.math` has its own Pool that it uses when you call these functions:

    - `lovr.math.vec3`
    - `lovr.math.quat`
    - `lovr.math.mat4`

    So it's usually more convenient to use those functions.  Pools are available to use if you have
    a need for more control over the memory used for your vectors.
  ]],
  arguments = {
    {
      name = 'size',
      type = 'number',
      description = 'The size of the Pool, in bytes.'
    },
    {
      name = 'resizable',
      type = 'boolean',
      default = 'false',
      description = 'Whether or not the Pool will resize itself.'
    }
  },
  returns = {
    {
      name = 'pool',
      type = 'Pool',
      description = 'The new Pool.'
    }
  },
  related = {
    'lovr.math.vec3',
    'lovr.math.quat',
    'lovr.math.mat4'
  }
}
