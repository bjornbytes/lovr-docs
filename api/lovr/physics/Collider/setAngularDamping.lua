return {
  summary = 'Set the angular damping of the Collider.',
  description = [[
    Sets the angular damping of the Collider.  Angular damping is similar to drag or air resistance,
    reducing the Collider's angular velocity over time.
  ]],
  arguments = {
    damping = {
      type = 'number',
      description = 'The angular damping.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'damping' },
      returns = {}
    }
  },
  notes = [[
    The default damping is .05, meaning the collider will lose approximately 5% of its velocity each
    second.  A damping value of zero means the Collider will not lose velocity over time.

    Negative damping is not meaningful and will be clamped to zero.
  ]],
  related = {
    'Collider:getLinearDamping',
    'Collider:setLinearDamping',
    'Collider:getInertia',
    'Collider:setInertia'
  }
}
