return {
  summary = 'Get the angular damping of the Collider.',
  description = [[
    Returns the angular damping of the Collider.  Angular damping is similar to drag or air
    resistance, reducing the Collider's angular velocity over time.
  ]],
  arguments = {},
  returns = {
    damping = {
      type = 'number',
      description = 'The angular damping.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'damping' }
    }
  },
  notes = [[
    The default damping is .05, meaning the collider will lose approximately 5% of its angular
    velocity each second.  A damping value of zero means the Collider will not lose velocity over
    time.
  ]],
  related = {
    'Collider:getLinearDamping',
    'Collider:setLinearDamping',
    'Collider:getInertia',
    'Collider:setInertia'
  }
}
