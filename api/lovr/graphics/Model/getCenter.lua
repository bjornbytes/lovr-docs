return {
  summary = 'Get the center of the Model\'s bounding box.',
  description = [[
    Returns the center of the Model's axis-aligned bounding box, relative to the Model's origin.
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
    x = {
      type = 'number',
      description = 'The x coordinate of the center of the bounding box.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the center of the bounding box.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the center of the bounding box.'
    }
  },
  variants = {
    {
      description = 'Get the center of the whole Model.',
      arguments = {},
      returns = { 'x', 'y', 'z' }
    },
    {
      description = 'Get the center of a single mesh in the Model.',
      arguments = { 'mesh' },
      returns = { 'x', 'y', 'z' }
    },
    {
      description = 'Get the center of a single part of a mesh in the Model.',
      arguments = { 'mesh', 'part' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Model:getWidth',
    'Model:getHeight',
    'Model:getDepth',
    'Model:getDimensions',
    'Model:getBoundingBox',
    'ModelData:getCenter'
  }
}
