return {
  summary = 'Get the height of the Model.',
  description = 'Returns the height of the Model, computed from its axis-aligned bounding box.',
  arguments = {},
  returns = {
    {
      name = 'height',
      type = 'number',
      description = 'The height of the Model.'
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
