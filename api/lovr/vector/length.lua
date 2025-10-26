return {
  summary = 'Get the length of a vector.',
  description = 'Returns the length of the vector.',
  arguments = {
    v = {
      type = 'vector',
      description = 'The vector to get the length of.'
    }
  },
  returns = {
    length = {
      type = 'number',
      description = 'The length of the vector.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'length' }
    }
  },
  notes = [[
    The length of a vector is computed as:

        math.sqrt(x ^ 2 + y ^ 2 + z ^ 2)
  ]],
  example = [[
    vector(0, 5, 0):length() --> 5
    vector(3, 4):length() --> 5
  ]],
  related = {
    'vector.normalize'
  }
}
