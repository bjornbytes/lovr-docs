return {
  summary = 'Get the bounciness of the Collider.',
  description = [[
    Returns the restitution of the Collider.  Restitution makes a Collider bounce when it collides
    with other objects.  A restitution value of zero would result in an inelastic collision
    response, whereas 1.0 would result in an elastic collision that preserves all of the velocity.
    The restitution can be bigger than 1.0 to make the collision even more bouncy.
  ]],
  arguments = {},
  returns = {
    restitution = {
      type = 'number',
      description = 'The restitution of the Collider.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'restitution' }
    }
  },
  notes = [[
    To improve stability of the simulation and allow colliders to come to rest, restitution is only
    applied if the collider is moving above a certain speed.  This can be configured using the
    `restitutionThreshold` option in `lovr.physics.newWorld`.
  ]],
  related = {
    'Contact:getRestitution',
    'Contact:setRestitution',
    'Collider:getFriction',
    'Collider:setFriction'
  }
}
