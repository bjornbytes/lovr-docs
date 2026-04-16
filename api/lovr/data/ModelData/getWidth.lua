return {
  summary = 'Get the width of the model.',
  description = 'Returns the width of the model, computed from its axis-aligned bounding box.',
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
      description = 'Get the width of the whole model.',
      arguments = {},
      returns = { 'width' }
    },
    {
      description = 'Get the width of a single mesh in the model.',
      arguments = { 'mesh' },
      returns = { 'width' }
    },
    {
      description = 'Get the width of a single part of a mesh in the model.',
      arguments = { 'mesh', 'part' },
      returns = { 'width' }
    }
  },
  related = {
    'ModelData:getHeight',
    'ModelData:getDepth',
    'ModelData:getDimensions',
    'ModelData:getCenter',
    'ModelData:getBoundingBox',
    'Model:getWidth'
  }
}
