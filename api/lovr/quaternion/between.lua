return {
  summary = 'Get a quaternion that rotates between two direction vectors.',
  description = [[
    Returns a quaternion that rotates between two direction vectors.

    For correct results, the direction vectors should be normalized.
  ]],
  arguments = {
    a = {
      type = 'vector',
      description = 'The first direction.'
    },
    b = {
      type = 'vector',
      description = 'The second direction.'
    }
  },
  returns = {
    q = {
      type = 'quaternion',
      description = 'A quaternion that rotates from `a` to `b`.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b' },
      returns = { 'q' }
    }
  },
  related = {
    'quaternion.lookdir',
    'vector.angle'
  }
}
