return {
  summary = 'Get the linear damping of the Collider.',
  description = [[
    Returns the linear damping of the Collider.  Linear damping is similar to drag or air
    resistance, slowing the Collider down over time.
  ]],
  arguments = {},
  returns = {
    damping = {
      type = 'number',
      description = 'The linear damping.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'damping' }
    }
  },
  notes = [[
    The default damping is .05, meaning the collider will lose approximately 5% of its velocity each
    second.  A damping value of zero means the Collider will not lose velocity over time.
  ]],
  related = {
    'Collider:getAngularDamping',
    'Collider:setAngularDamping',
    'Collider:getGravityScale',
    'Collider:setGravityScale'
  }
}
