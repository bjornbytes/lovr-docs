return {
  summary = 'Get the number of faces in the convex hull.',
  description = 'Returns the number of faces in the convex hull.',
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of faces.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  related = {
    'ConvexShape:getFace'
  }
}
