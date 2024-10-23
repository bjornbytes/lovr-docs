return {
  summary = 'Get the scale the ConvexShape was created with.',
  description = 'Returns the scale the ConvexShape was created with.',
  arguments = {},
  returns = {
    scale = {
      type = 'number',
      description = 'The scale.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'scale' }
    }
  },
  related = {
    'lovr.physics.newConvexShape',
    'World:newConvexCollider'
  }
}
