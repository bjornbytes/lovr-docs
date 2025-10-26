return {
  summary = 'Get the cross product of two vectors.',
  description = [[
    Returns the cross product of two vectors.  This is a vector that is perpendicular to both
    vectors.
  ]],
  arguments = {
    v1 = {
      type = 'vector',
      description = 'The first vector.'
    },
    v2 = {
      type = 'vector',
      description = 'The second vector.'
    }
  },
  returns = {
    cross = {
      type = 'vector',
      description = 'A vector perpendicular to both `v1` and `v2`.'
    }
  },
  variants = {
    {
      arguments = { 'v1', 'v2' },
      returns = { 'cross' }
    }
  },
  example = [[
    vector.cross(vector(1, 0, 0), vector(0, 1, 0)) --> vector(0, 0, 1)
  ]]
}
