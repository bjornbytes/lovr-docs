return {
  summary = 'Create a matrix that reflects across a plane.',
  description = [[
    Turns the matrix into a reflection matrix that transforms values as though they were reflected
    across a plane.
  ]],
  arguments = {
    position = {
      type = 'Vec3',
      description = 'The position of the plane.'
    },
    normal = {
      type = 'Vec3',
      description = 'The normal vector of the plane.'
    }
  },
  returns = {
    m = {
      type = 'Mat4',
      description = 'The original matrix, with modified values.'
    }
  },
  variants = {
    {
      arguments = { 'position', 'normal' },
      returns = { 'm' }
    }
  }
}
