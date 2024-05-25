return {
  summary = 'Set the friction of the Collider.',
  description = [[
    Sets the friction of the Collider.  Friction determines how easy it is for two colliders to
    slide against each other.  Low friction makes it easier for a collider to slide, simulating a
    smooth surface.
  ]],
  arguments = {
    friction = {
      type = 'number',
      description = 'The friction of the Collider.'
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
    The default friction is .2.

    When two colliders collide, their friction is combined using the geometric mean:

        friction = (frictionA * frictionB) ^ .5
  ]],
  related = {
    'Contact:getFriction',
    'Contact:setFriction',
    'Collider:getRestitution',
    'Collider:setRestitution'
  }
}
