return {
  summary = 'Set a projection using raw FoV angles.',
  description = [[
    Sets a projection matrix using raw projection values.

    This can be used for asymmetric or oblique projections.
  ]],
  arguments = {
    {
      name = 'left',
      type = 'number',
      description = 'The left angle of the projection.'
    },
    {
      name = 'right',
      type = 'number',
      description = 'The right angle of the projection.'
    },
    {
      name = 'up',
      type = 'number',
      description = 'The top angle of the projection.'
    },
    {
      name = 'bottom',
      type = 'number',
      description = 'The bottom angle of the projection.'
    },
    {
      name = 'near',
      type = 'number',
      description = 'The near plane of the projection.'
    },
    {
      name = 'far',
      type = 'number',
      description = 'The far plane of the projection.'
    }
  },
  returns = {
    {
      name = 'm',
      type = 'Mat4',
      description = 'The original matrix.'
    }
  },
  related = {
    'Mat4:orthographic',
    'Mat4:perspective',
    'lovr.graphics.setProjection'
  }
}
