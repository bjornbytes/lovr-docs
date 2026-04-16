return {
  summary = 'Get the height of the Model.',
  description = 'Returns the height of the Model, computed from its axis-aligned bounding box.',
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
      description = 'Get the height of the whole Model.',
      arguments = {},
      returns = { 'height' }
    },
    {
      description = 'Get the height of a single mesh in the Model.',
      arguments = { 'mesh' },
      returns = { 'height' }
    },
    {
      description = 'Get the height of a single part of a mesh in the Model.',
      arguments = { 'mesh', 'part' },
      returns = { 'height' }
    }
  },
  related = {
    'Model:getWidth',
    'Model:getDepth',
    'Model:getDimensions',
    'Model:getCenter',
    'Model:getBoundingBox',
    'ModelData:getHeight'
  }
}
