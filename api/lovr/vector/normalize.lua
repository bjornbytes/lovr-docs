return {
  summary = 'Get a normalized vector.',
  description = [[
    Returns a normalized version of the input vector.  This is a vector that points in the same
    direction as the original, but has a length of 1.
  ]],
  arguments = {
    v = {
      type = 'vector',
      description = 'The vector to normalize.'
    }
  },
  returns = {
    normalized = {
      type = 'vector',
      description = 'The normalized vector.'
    }
  },
  variants = {
    {
      arguments = { 'v' },
      returns = { 'normalized' }
    }
  },
  notes = 'When given a zero-length vector, the input vector is returned unchanged.',
  related = {
    'vector.length'
  }
}
