return {
  summary = 'Create a new Pool.',
  description = [[
    Creates a new `Pool`, used for allocating vector and matrix objects efficiently.  If you just
    need vectors, you can use the more convenient functions `lovr.math.vec3`, `lovr.math.quat`, and
    `lovr.math.mat4`.
  ]],
  arguments = {
    {
      name = 'size',
      type = 'number',
      description = 'The size of the Pool, in bytes.'
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
