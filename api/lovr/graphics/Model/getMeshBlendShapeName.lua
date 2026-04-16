return {
  summary = 'Get the name of a blend shape.',
  description = 'Returns the name of a blend shape.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of a mesh.'
    },
    blendshape = {
      type = 'number',
      description = 'The index of a blend shape in the mesh.'
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
      arguments = { 'mesh', 'blendshape' },
      returns = { 'name' }
    }
  },
  related = {
    'Model:getBlendShapeName',
    'Model:getMeshBlendShapeCount',
    'ModelData:getMeshBlendShapeName'
  }
}
