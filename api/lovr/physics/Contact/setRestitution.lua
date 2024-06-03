return {
  summary = 'Set the bounciness of the Contact.',
  description = [[
    Sets the restitution of the Contact.  Restitution makes the Colliders bounce off of each other.
    A restitution value of zero results in an inelastic collision response, whereas 1.0 results in
    an elastic collision that preserves all of the velocity.  Restitution can be bigger than 1.0 to
    make the collision even more bouncy.
  ]],
  arguments = {
    restitution = {
      type = 'number',
      description = 'The contact restitution.'
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
    The default restitution is the maximum restitution of either of the colliders.

    Negative restitution values will be clamped to zero.
  ]],
  related = {
    'Collider:getRestitution',
    'Collider:setRestitution',
    'Contact:getFriction',
    'Contact:setFriction'
  }
}
