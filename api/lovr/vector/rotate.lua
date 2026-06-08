return {
  deprecated = [[
    Instead of using this function, use the multiplication operator (`quaternion * vector`).
  ]],
  summary = 'Rotate the vector by a quaternion.',
  description = 'Rotates the vector by a quaternion, returning a new rotated vector.',
  arguments = {
    v = {
      type = 'vector',
      description = 'The vector to rotate.'
    },
    q = {
      type = 'quaternion',
      description = 'The rotation.'
    }
  },
  returns = {
    v = {
      type = 'number',
      description = 'The rotated vector.'
    }
  },
  variants = {
    {
      arguments = { 'v', 'q' },
      returns = { 'v' }
    }
  }
}
