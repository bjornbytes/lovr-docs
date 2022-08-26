return {
  summary = 'Get the width of the Model.',
  description = 'Returns the width of the Model, computed from its axis-aligned bounding box.',
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of the Model.'
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
