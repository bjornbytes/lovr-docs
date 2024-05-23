return {
  summary = 'Set the gravity scale of the Collider.',
  description = [[
    Sets the gravity scale of the Collider.  This is multiplied with the global gravity from the
    World, so 1.0 is regular gravity, 0.0 will ignore gravity, etc.
  ]],
  arguments = {
    scale = {
      type = 'number',
      description = 'The gravity scale.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'scale' },
      returns = {}
    }
  },
  related = {
    'World:getGravity',
    'World:setGravity',
    'Collider:getLinearDamping',
    'Collider:setLinearDamping'
  }
}
