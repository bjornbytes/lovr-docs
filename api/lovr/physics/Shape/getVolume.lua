return {
  summary = 'Get the volume of the Shape.',
  description = 'Returns the volume of the Shape, in cubic meters.',
  arguments = {},
  returns = {
    volume = {
      type = 'number',
      description = 'The volume of the shape, in cubic meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'volume' }
    }
  },
  notes = [[
    `MeshShape` and `TerrainShape` do not have volume, and will return 0.
  ]],
  related = {
    'Shape:getDensity',
    'Shape:setDensity',
    'Shape:getMass',
    'Shape:getAABB'
  }
}
