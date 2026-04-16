return {
  summary = 'Get the height of the model.',
  description = 'Returns the height of the model, computed from its axis-aligned bounding box.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The mesh to get the height of.'
    },
    part = {
      type = 'number',
      description = 'The part to get the height of.'
    }
  },
  returns = {
    height = {
      type = 'number',
      description = 'The height.'
    }
  },
  variants = {
    {
      description = 'Get the height of the whole model.',
      arguments = {},
      returns = { 'height' }
    },
    {
      description = 'Get the height of a single mesh in the model.',
      arguments = { 'mesh' },
      returns = { 'height' }
    },
    {
      description = 'Get the height of a single part of a mesh in the model.',
      arguments = { 'mesh', 'part' },
      returns = { 'height' }
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getDepth',
    'ModelData:getDimensions',
    'ModelData:getCenter',
    'ModelData:getBoundingBox',
    'Model:getHeight'
  }
}
