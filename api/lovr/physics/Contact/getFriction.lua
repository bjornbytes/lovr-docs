return {
  summary = 'Get the friction of the Contact.',
  description = [[
    Returns the friction of the Contact.  Lower friction makes it easier for the colliders to slide
    against each other.
  ]],
  arguments = {},
  returns = {
    friction = {
      type = 'number',
      description = 'The contact friction.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'friction' }
    }
  },
  related = {
    'Collider:getFriction',
    'Collider:setFriction',
    'Contact:getRestitution',
    'Contact:setRestitution'
  }
}
