return {
  summary = 'Get the surface velocity of the Contact.',
  description = [[
    Returns the world space surface velocity of the Contact.  This can be used to achieve a conveyor
    belt effect.
  ]],
  arguments = {},
  returns = {
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
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  }
}
