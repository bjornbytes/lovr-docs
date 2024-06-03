return {
  summary = 'Get the bounciness of the Contact.',
  description = [[
    Returns the restitution of the Contact.  Restitution makes the Colliders bounce off of each
    other.  A restitution value of zero results in an inelastic collision response, whereas 1.0
    results in an elastic collision that preserves all of the velocity.  Restitution can be bigger
    than 1.0 to make the collision even more bouncy.
  ]],
  arguments = {},
  returns = {
    restitution = {
      type = 'number',
      description = 'The contact restitution.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'restitution' }
    }
  },
  notes = 'The default restitution is the maximum restitution of either of the colliders.',
  related = {
    'Collider:getRestitution',
    'Collider:setRestitution',
    'Contact:getFriction',
    'Contact:setFriction'
  }
}
