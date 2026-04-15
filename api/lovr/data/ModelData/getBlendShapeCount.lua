return {
  summary = 'Get the total number of blend shapes in the model.',
  description = 'Returns the total number of blend shapes in the model.',
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The total number of blend shapes in the model.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  related = {
    'ModelData:getBlendShapeName',
    'ModelData:getMeshBlendShapeCount',
    'ModelData:getMeshBlendShapeName'
  }
}
