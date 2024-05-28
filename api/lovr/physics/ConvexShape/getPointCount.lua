return {
  summary = 'Get the number of points in the convex hull.',
  description = 'Returns the number of points in the convex hull.',
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of points.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  notes = [[
    This isn't necessarily the same as the number of points or vertices that were used to create the
    shape, since points inside the hull will be discarded.
  ]],
  related = {
    'ConvexShape:getPoint'
  }
}
