return {
  summary = 'Get the depth of the model.',
  description = 'Returns the depth of the model, computed from its axis-aligned bounding box.',
  arguments = {},
  returns = {
    {
      name = 'depth',
      type = 'number',
      description = 'The depth of the model.'
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getHeight',
    'ModelData:getDimensions',
    'ModelData:getCenter',
    'ModelData:getBoundingBox',
    'Model:getDepth'
  }
}
