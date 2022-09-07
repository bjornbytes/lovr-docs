return {
  summary = 'Turn the matrix into a perspective projection.',
  description = [[
    Sets this matrix to represent a perspective projection.

    This can be used with `lovr.graphics.setProjection`, or it can be sent to a `Shader` for use in
    GLSL.
  ]],
  arguments = {
    near = {
      type = 'number',
      description = 'The near plane.'
    },
    far = {
      type = 'number',
      description = 'The far plane.'
    },
    fov = {
      type = 'number',
      description = 'The vertical field of view (in radians).'
    },
    aspect = {
      type = 'number',
      description = 'The horizontal aspect ratio of the projection (width / height).'
    }
  },
  returns = {
    m = {
      type = 'Mat4',
      description = 'The original matrix.'
    }
  },
  variants = {
    {
      arguments = { 'near', 'far', 'fov', 'aspect' },
      returns = { 'm' }
    }
  },
  related = {
    'Mat4:orthographic',
    'Mat4:fov',
    'lovr.graphics.setProjection'
  }
}
