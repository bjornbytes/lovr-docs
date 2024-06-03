return {
  summary = 'Get the normal vector of the Contact.',
  description = [[
    Returns the normal vector of the Contact.  This is a direction vector that represents which
    direction the second collider should move to resolve the collision.
  ]],
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x component of the normal vector.'
    },
    y = {
      type = 'number',
      description = 'The y component of the normal vector.'
    },
    z = {
      type = 'number',
      description = 'The z component of the normal vector.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Contact:getOverlap',
    'Contact:getPoints'
  }
}
