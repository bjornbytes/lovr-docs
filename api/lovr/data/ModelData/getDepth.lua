return {
  summary = 'Get the depth of the model.',
  description = 'Returns the depth of the model, computed from its axis-aligned bounding box.',
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
      description = 'Get the depth of the whole model.',
      arguments = {},
      returns = { 'depth' }
    },
    {
      description = 'Get the depth of a single mesh in the model.',
      arguments = { 'mesh' },
      returns = { 'depth' }
    },
    {
      description = 'Get the depth of a single part of a mesh in the model.',
      arguments = { 'mesh', 'part' },
      returns = { 'depth' }
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getHeight',
    'ModelData:getDimensions',
    'ModelData:getCenter',
    'ModelData:getBoundingBox',
    'Model:getDepth'
  }
}
