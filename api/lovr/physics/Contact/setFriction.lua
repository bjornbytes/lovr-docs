return {
  summary = 'Set the friction of the Contact.',
  description = [[
    Sets the friction of the Contact.  Lower friction makes it easier for the colliders to slide
    against each other.  This overrides the default friction computed by the friction of the two
    Colliders.
  ]],
  arguments = {
    friction = {
      type = 'number',
      description = 'The contact friction.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'friction' },
      returns = {}
    }
  },
  notes = [[
    The default friction is computed from the geometric mean of the Colliders' friction:

        friction = (frictionA * frictionB) ^ .5

    Negative frictions will be clamped to zero.
  ]],
  related = {
    'Collider:getFriction',
    'Collider:setFriction',
    'Contact:getRestitution',
    'Contact:setRestitution'
  }
}
