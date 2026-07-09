return {
  summary = 'Get the length of the Curve.',
  description = [[
    Returns the length of the curve, from the beginning of the curve up to the specified `t`
    parameter. `t` defaults to `1.0`, so by default this returns the length of the entire curve.
  ]],
  arguments = {
    t = {
      type = 'number?',
      default = '1.0',
      description = 'The t parameter to get the length at.'
    },
    iterations = {
      type = 'number?',
      default = '16',
      description = [[
        How many iterations to use to compute the length.  More iterations will give a more accurate
        result, but will take longer to compute.
      ]]
    }
  },
  returns = {
    length = {
      type = 'number',
      description = 'The length of the curve.'
    }
  },
  variants = {
    {
      arguments = { 't', 'iterations' },
      returns = { 'length' }
    }
  },
  related = {
    'Curve:step',
    'Curve:evaluate'
  }
}
