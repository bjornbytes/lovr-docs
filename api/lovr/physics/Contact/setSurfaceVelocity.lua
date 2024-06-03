return {
  summary = 'Set the surface velocity of the Contact.',
  description = [[
    Sets the world space surface velocity of the Contact.  This can be used to achieve a conveyor
    belt effect.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the surface velocity.'
    },
    y = {
      type = 'number',
      description = 'The y component of the surface velocity.'
    },
    z = {
      type = 'number',
      description = 'The z component of the surface velocity.'
    },
    velocity = {
      type = 'Vec3',
      description = 'The surface velocity.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'velocity' },
      returns = {}
    }
  }
}
