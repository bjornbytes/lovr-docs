return {
  summary = 'Get an interpolated quaternion between two quaternions.',
  description = [[
    Performs spherical linear interpolation between two quaternions, returning a mix between the
    two.
  ]],
  arguments = {
    a = {
      type = 'quaternion',
      description = 'The first quaternion.'
    },
    b = {
      type = 'vector',
      description = 'The second quaternion.'
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
    q = {
      type = 'quaternion',
      description = 'The interpolated quaternion.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b', 't' },
      returns = { 'q' }
    }
  },
  related = {
    'vector.lerp'
  }
}
