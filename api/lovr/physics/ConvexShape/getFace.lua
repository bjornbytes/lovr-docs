return {
  summary = 'Get the point indices of one of the faces of the convex hull.',
  description = [[
    Returns the indices of points that make up one of the faces of the convex hull.
  ]],
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the face.'
    }
  },
  returns = {
    points = {
      type = 'table',
      description = [[
        A table with point indices.  Use `ConvexShape:getPoint` to get the coordinates.  The points
        are given in counterclockwise order.
      ]],
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'points' }
    }
  },
  related = {
    'ConvexShape:getPoint',
    'ConvexShape:getFaceCount'
  }
}
