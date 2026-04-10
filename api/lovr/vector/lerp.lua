return {
  summary = 'Get an interpolated vector between two vectors.',
  description = 'Returns an interpolated vector between two vectors.',
  arguments = {
    a = {
      type = 'vector',
      description = 'The first vector.'
    },
    b = {
      type = 'vector',
      description = 'The second vector.'
    },
    t = {
      type = 'number',
      description = [[
        The interpolation parameter.  `0.0` returns `a`, `1.0` returns `b`, `0.5` returns a vector
        halfway between `a` and `b`, etc.
      ]]
    }
  },
  returns = {
    v = {
      type = 'vector',
      description = 'The interpolated vector.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b', 't' },
      returns = { 'v' }
    }
  },
  related = {
    'quaternion.slerp'
  }
}
