return {
  summary = 'Get the mass of the Shape.',
  description = [[
    Returns the mass of the Shape, in kilograms.  The mass is the volume multiplied by the density.
  ]],
  arguments = {},
  returns = {
    mass = {
      type = 'number',
      description = 'The mass of the Shape, in kilograms.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mass' }
    }
  },
  notes = [[
    The mass of a Collider is the sum of the mass of all of its Shapes.  The center of a mass of a
    Collider is the average of all of its Shapes, weighted by their mass.

    `MeshShape` and `TerrainShape` do not have mass, and will return 0.
  ]],
  related = {
    'Collider:getMass',
    'Collider:setMass',
    'Collider:resetMassData',
    'Shape:getVolume',
    'Shape:getDensity',
    'Shape:setDensity',
    'Shape:getInertia',
    'Shape:getCenterOfMass'
  }
}
