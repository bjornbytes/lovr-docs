return {
  summary = 'Get one of the points in the convex hull.',
  description = 'Returns one of the points in the convex hull, in local space.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the point.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x coordinate.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'ConvexShape:getPointCount'
  }
}
