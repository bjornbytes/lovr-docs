return {
  summary = 'Types of matrix on the transform stack.',
  description = [[
    When modifying the coordinate system using functions like `lovr.graphics.translate`, you can
    modify either the model matrix or the view matrix.  The model matrix is meant to represent the
    transform of the object being rendered, whereas the view matrix is meant to represent the
    transform of the camera.  By default, the model matrix is manipulated.
  ]],
  values = {
    {
      name = 'model',
      description = 'The model matrix.'
    },
    {
      name = 'view',
      description = 'The view matrix.'
    }
  },
  related = {
    'lovr.graphics.translate',
    'lovr.graphics.rotate',
    'lovr.graphics.scale',
    'lovr.graphics.transform'
  }
}
