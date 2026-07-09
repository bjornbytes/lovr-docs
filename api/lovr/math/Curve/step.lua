return {
  summary = 'Get the curve parameter at a given distance along the curve.',
  description = [[
    Steps along the curve a given distance and returns the curve parameter at that point.  This is
    the inverse of `Curve:getLength`.
  ]],
  arguments = {
    distance = {
      type = 'number',
      description = 'The distance to step along the curve.'
    },
    iterations = {
      type = 'number?',
      default = '16',
      description = [[
        How many iterations to use to compute the result.  More iterations will give a more accurate
        result, but will take longer to compute.
      ]]
    }
  },
  returns = {
    t = {
      type = 'number',
      description = 'The parameter of the curve at the given distance along the curve.'
    }
  },
  variants = {
    {
      arguments = { 'distance', 'iterations' },
      returns = { 't' }
    }
  },
  related = {
    'Curve:getLength',
    'Curve:evaluate'
  }
}
