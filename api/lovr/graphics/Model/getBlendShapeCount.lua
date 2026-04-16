return {
  summary = 'Get the total number of blend shapes in the Model.',
  description = [[
    Returns the total number of blend shapes in the Model.

    This is a combined list from all the meshes.  It is also possible to query the blend shapes for
    a single mesh, using `Model:getMeshBlendShapeCount`.
  ]],
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The total number of blend shapes in the Model.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  related = {
    'Model:getBlendShapeName',
    'Model:getMeshBlendShapeCount',
    'Model:getMeshBlendShapeName',
    'ModelData:getBlendShapeCount'
  }
}
