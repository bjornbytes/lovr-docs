return {
  summary = 'Get the center of mass of the Shape.',
  description = [[
    Returns the center of mass of the Shape.  Currently the only shape that can have a non-zero
    center of mass is `ConvexShape`.
  ]],
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x position of the center of mass.'
    },
    y = {
      type = 'number',
      description = 'The y position of the center of mass.'
    },
    z = {
      type = 'number',
      description = 'The z position of the center of mass.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  notes = [[
    `MeshShape` and `TerrainShape` do not have a well-defined mass, this function returns zero for
    those shapes.
  ]],
  related = {
    'Collider:getCenterOfMass',
    'Shape:getOffset',
    'Shape:setOffset'
  }
}
