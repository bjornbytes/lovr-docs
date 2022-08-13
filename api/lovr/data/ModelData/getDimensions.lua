return {
  summary = 'Get the dimensions of the model.',
  description = [[
    Returns the width, height, and depth of the model, computed from its axis-aligned bounding box.
  ]],
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of the model.'
    },
    {
      name = 'height',
      type = 'number',
      description = 'The height of the model.'
    },
    {
      name = 'depth',
      type = 'number',
      description = 'The depth of the model.'
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getHeight',
    'ModelData:getDepth',
    'ModelData:getCenter',
    'ModelData:getBoundingBox'
  }
}
