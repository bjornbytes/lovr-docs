return {
  summary = 'Get the depth of the Model.',
  description = 'Returns the depth of the Model, computed from its axis-aligned bounding box.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The mesh to get the depth of.'
    },
    part = {
      type = 'number',
      description = 'The part to get the depth of.'
    }
  },
  returns = {
    depth = {
      type = 'number',
      description = 'The depth.'
    }
  },
  variants = {
    {
      description = 'Get the depth of the whole Model.',
      arguments = {},
      returns = { 'depth' }
    },
    {
      description = 'Get the depth of a single mesh in the Model.',
      arguments = { 'mesh' },
      returns = { 'depth' }
    },
    {
      description = 'Get the depth of a single part of a mesh in the Model.',
      arguments = { 'mesh', 'part' },
      returns = { 'depth' }
    }
  },
  related = {
    'Model:getWidth',
    'Model:getHeight',
    'Model:getDimensions',
    'Model:getCenter',
    'Model:getBoundingBox',
    'ModelData:getDepth'
  }
}
