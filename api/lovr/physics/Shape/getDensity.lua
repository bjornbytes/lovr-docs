return {
  summary = 'Get the density of the Shape.',
  description = [[
    Returns the density of the Shape, in kilograms per cubic meter.  The density, combined with the
    volume of the Shape, determines the Shape's overall mass.
  ]],
  arguments = {},
  returns = {
    density = {
      type = 'number',
      description = 'The density of the Shape, in kilograms per cubic meter.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'density' }
    }
  },
  notes = [[
    The default density is 1,000, which is the density of water.

    `MeshShape` and `TerrainShape` do not have volume, and return 0.
  ]],
  related = {
    'Shape:getVolume',
    'Shape:getMass'
  }
}
