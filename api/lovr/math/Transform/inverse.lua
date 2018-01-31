return {
  summary = 'Get the inverse of the Transform.',
  description = [[
    Returns a new Transform representing the inverse of the original.  The inverse "cancels out" the
    effects of the original, so applying one onto the other will result in the origin.
  ]],
  arguments = {},
  returns = {
    {
      name = 'inverse',
      type = 'Transform',
      description = 'The inverse transform.'
    }
  },
  related = {
    'Transform:inverseTransformPoint'
  }
}
