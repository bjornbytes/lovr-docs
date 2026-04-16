return {
  summary = 'Get the total number of blend shapes in the model.',
  description = [[
    Returns the total number of blend shapes in the model.

    This is a combined list from all the meshes.  It is also possible to query the blend shapes for
    a single mesh, using `ModelData:getMeshBlendShapeCount`.
  ]],
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
    'ModelData:getMeshBlendShapeName',
    'Model:getBlendShapeCount'
  }
}
