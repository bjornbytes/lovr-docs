return {
  summary = 'Get the cross product of two vectors.',
  description = [[
    Returns the cross product of two vectors.  This is a vector that is perpendicular to both
    vectors.
  ]],
  arguments = {
    a = {
      type = 'vector',
      description = 'The first vector.'
    },
    b = {
      type = 'vector',
      description = 'The second vector.'
    }
  },
  returns = {
    cross = {
      type = 'vector',
      description = 'A vector perpendicular to both `a` and `b`.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b' },
      returns = { 'cross' }
    }
  },
  notes = 'If the two input vectors are normalized, the cross product will be normalized as well.',
  example = 'vector.cross(vector(1, 0, 0), vector(0, 1, 0)) --> vector(0, 0, 1)',
  related = {
    'vector.dot'
  }
}
