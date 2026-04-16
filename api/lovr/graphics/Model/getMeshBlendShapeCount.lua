return {
  summary = 'Get the number of blend shapes in one of the Model\'s meshes.',
  description = 'Returns the number of blend shapes in one of the Model\'s meshes.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The index of the mesh.'
    }
  },
  returns = {
    count = {
      type = 'number',
      description = 'The number of blend shapes the mesh has.'
    }
  },
  variants = {
    {
      arguments = { 'mesh' },
      returns = { 'count' }
    }
  },
  related = {
    'Model:getBlendShapeCount',
    'ModelData:getMeshBlendShapeCount'
  }
}
