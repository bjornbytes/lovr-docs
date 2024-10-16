return {
  summary = 'Set the bounciness of the Collider.',
  description = [[
    Sets the restitution of the Collider.  Restitution makes a Collider bounce when it collides with
    other objects.  A restitution value of zero would result in an inelastic collision response,
    whereas 1.0 would result in an elastic collision that preserves all of the velocity.
  ]],
  arguments = {
    restitution = {
      type = 'number',
      description = 'The restitution of the Collider.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'restitution' },
      returns = {}
    }
  },
  notes = [[
    To improve stability of the simulation and allow colliders to come to rest, restitution is only
    applied if the collider is moving above a certain speed.  This can be configured using the
    `restitutionThreshold` option in `lovr.physics.newWorld`.

    Negative restitution is not meaningful and is clamped to zero.
  ]],
  related = {
    'Contact:getRestitution',
    'Contact:setRestitution',
    'Collider:getFriction',
    'Collider:setFriction'
  }
}
