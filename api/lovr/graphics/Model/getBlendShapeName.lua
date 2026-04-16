return {
  summary = 'Get the name of a blend shape.',
  description = 'Returns the name of a blend shape.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of a blend shape.'
    }
  },
  returns = {
    name = {
      type = 'string',
      description = 'The name of the blend shape.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'name' }
    }
  },
  related = {
    'Model:getBlendShapeCount',
    'Model:getMeshBlendShapeCount',
    'Model:getMeshBlendShapeName',
    'ModelData:getBlendShapeName'
  }
}
