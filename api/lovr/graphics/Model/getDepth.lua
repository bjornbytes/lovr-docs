return {
  summary = 'Get the depth of the Model.',
  description = 'Returns the depth of the Model, computed from its axis-aligned bounding box.',
  arguments = {},
  returns = {
    {
      name = 'depth',
      type = 'number',
      description = 'The depth of the Model.'
    }
  },
  related = {
    'Model:getWidth',
    'Model:getHeight',
    'Model:getDimensions',
    'Model:getCenter',
    'Model:getBoundingBox',
    'ModelData:getDepth'
  }
}
