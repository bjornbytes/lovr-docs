return {
  summary = 'Get the dimensions of the Model.',
  description = [[
    Returns the width, height, and depth of the Model, computed from its axis-aligned bounding box.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The mesh to get the dimensions of.'
    },
    part = {
      type = 'number',
      description = 'The part to get the dimensions of.'
    }
  },
  returns = {
    width = {
      type = 'number',
      description = 'The width.'
    },
    height = {
      type = 'number',
      description = 'The height.'
    },
    depth = {
      type = 'number',
      description = 'The depth.'
    }
  },
  variants = {
    {
      description = 'Get the dimensions of the whole Model.',
      arguments = {},
      returns = { 'width', 'height', 'depth' }
    },
    {
      description = 'Get the dimensions of a single mesh in the Model.',
      arguments = { 'mesh' },
      returns = { 'width', 'height', 'depth' }
    },
    {
      description = 'Get the dimensions of a single part of a mesh in the Model.',
      arguments = { 'mesh', 'part' },
      returns = { 'width', 'height', 'depth' }
    }
  },
  related = {
    'Model:getWidth',
    'Model:getHeight',
    'Model:getDepth',
    'Model:getCenter',
    'Model:getBoundingBox',
    'ModelData:getDimensions'
  }
}
