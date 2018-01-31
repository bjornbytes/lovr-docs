return {
  summary = 'Combine two Transforms.',
  description = 'Applies a Transform onto this Transform.',
  arguments = {
    {
      name = 'other',
      type = 'Transform',
      description = [[
        Combine two Transforms together.  Order matters, so applying Transforms in different orders
        will yield different results.
      ]]
    }
  },
  returns = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The original Transform.'
    }
  }
}
