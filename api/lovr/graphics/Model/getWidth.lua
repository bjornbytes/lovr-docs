return {
  summary = 'Get the width of the Model.',
  description = 'Returns the width of the Model, computed from its axis-aligned bounding box.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The mesh to get the width of.'
    },
    part = {
      type = 'number',
      description = 'The part to get the width of.'
    }
  },
  returns = {
    width = {
      type = 'number',
      description = 'The width.'
    }
  },
  variants = {
    {
      description = 'Get the width of the whole Model.',
      arguments = {},
      returns = { 'width' }
    },
    {
      description = 'Get the width of a single mesh in the Model.',
      arguments = { 'mesh' },
      returns = { 'width' }
    },
    {
      description = 'Get the width of a single part of a mesh in the Model.',
      arguments = { 'mesh', 'part' },
      returns = { 'width' }
    }
  },
  related = {
    'Model:getHeight',
    'Model:getDepth',
    'Model:getDimensions',
    'Model:getCenter',
    'Model:getBoundingBox',
    'ModelData:getWidth'
  }
}
