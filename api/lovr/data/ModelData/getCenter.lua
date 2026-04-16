return {
  summary = 'Get the center of the model\'s bounding box.',
  description = [[
    Returns the center of the model's axis-aligned bounding box, relative to the model's origin.
  ]],
  arguments = {
    mesh = {
      type = 'number',
      description = 'The mesh to get the center of.'
    },
    part = {
      type = 'number',
      description = 'The part to get the center of.'
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
      description = 'Get the center of the whole model.',
      arguments = {},
      returns = { 'x', 'y', 'z' }
    },
    {
      description = 'Get the center of a single mesh in the model.',
      arguments = { 'mesh' },
      returns = { 'x', 'y', 'z' }
    },
    {
      description = 'Get the center of a single part of a mesh in the model.',
      arguments = { 'mesh', 'part' },
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getHeight',
    'ModelData:getDepth',
    'ModelData:getDimensions',
    'ModelData:getBoundingBox',
    'Model:getCenter'
  }
}
