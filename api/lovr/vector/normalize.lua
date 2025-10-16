return {
  summary = 'Get a normalized vector.',
  description = [[
    Returns the normalized version of the input vector (a vector that points in the same direction,
    but has a length of 1).
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
  notes = 'This can be called as a method, e.g. `v:normalize()`.'
}
