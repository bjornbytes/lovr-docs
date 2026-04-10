return {
  summary = 'Create a matrix that reflects across a plane.',
  description = [[
    Turns the matrix into a reflection matrix that transforms values as though they were reflected
    across a plane.
  ]],
  arguments = {
    position = {
      type = 'vector',
      description = 'The position of the plane.'
    },
    normal = {
      type = 'vector',
      description = 'The normal vector of the plane.'
    }
  },
  returns = {
    self = {
      type = 'Mat4',
      description = 'The reflected matrix.'
    }
  },
  variants = {
    {
      arguments = { 'position', 'normal' },
      returns = { 'self' }
    }
  }
}
