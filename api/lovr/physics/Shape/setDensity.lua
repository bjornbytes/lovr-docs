return {
  summary = 'Set the density of the Shape.',
  description = [[
    Sets the density of the Shape, in kilograms per cubic meter.  The density, combined with the
    volume of the Shape, determines the Shape's overall mass.
  ]],
  arguments = {
    density = {
      type = 'number',
      description = 'The density of the Shape, in kilograms per cubic meter.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'density' },
      returns = {}
    }
  },
  notes = [[
    This changes the mass of the Shape.  If the Shape is attached to a Collider with automatic mass
    enabled, the Collider's mass properties will change as well.

    The default density is 1,000, which is the density of water.

    `MeshShape` and `TerrainShape` do not have mass.
  ]],
  related = {
    'Shape:getVolume',
    'Shape:getMass'
  }
}
