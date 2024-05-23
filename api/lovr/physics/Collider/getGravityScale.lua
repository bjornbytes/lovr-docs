return {
  summary = 'Get the gravity scale of the Collider.',
  description = [[
    Returns the gravity scale of the Collider.  This is multiplied with the global gravity from the
    World, so 1.0 is regular gravity, 0.0 will ignore gravity, etc.
  ]],
  arguments = {},
  returns = {
    scale = {
      type = 'number',
      description = 'The gravity scale.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'scale' }
    }
  },
  related = {
    'World:getGravity',
    'World:setGravity',
    'Collider:getLinearDamping',
    'Collider:setLinearDamping'
  }
}
