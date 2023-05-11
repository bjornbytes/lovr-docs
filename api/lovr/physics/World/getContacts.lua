return {
  tag = 'worldCollision',
  summary = 'Get a list of points where 2 shapes intersect.',
  description = [[
    Computes collision information between 2 shapes and returns a list of contacts where the shapes
    intersect.  Each contact point consists of a position, a normal vector, and a penetration depth:

        { x, y, z, nx, ny, nz, depth }
  ]],
  arguments = {
    shapeA = {
      type = 'Shape',
      description = 'The first shape.'
    },
    shapeB = {
      type = 'Shape',
      description = 'The second shape.'
    }
  },
  returns = {
    contacts = {
      type = 'table',
      description = [[
        A list of contacts.  Each contact consists of 7 numbers: 3 for the contact position, 3 for
        the normal vector, and a depth value indicating how far the shapes intersect each other at
        the contact point.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'shapeA', 'shapeB' },
      returns = { 'contacts' }
    }
  },
  notes = [[
    This only detects collision information, it does not cause the shapes to collide with each
    other.  Use `World:collide` for that.

    This function ignores collision tags.
  ]],
  related = {
    'World:collide'
  }
}
