return {
  summary = 'Set the linear damping of the Collider.',
  description = [[
    Sets the linear damping of the Collider.  Linear damping is similar to drag or air resistance,
    slowing the Collider down over time.
  ]],
  arguments = {
    damping = {
      type = 'number',
      description = 'The linear damping.'
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
    'Collider:getAngularDamping',
    'Collider:setAngularDamping',
    'Collider:getGravityScale',
    'Collider:setGravityScale'
  }
}
