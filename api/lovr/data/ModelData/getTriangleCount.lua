return {
  summary = 'Get the number of triangles in the ModelData.',
  description = 'Returns the number of triangles in the ModelData.',
  arguments = {},
  returns = {
    {
      name = 'triangles',
      type = 'number',
      description = 'The number of triangles.'
    }
  },
  notes = [[
    This is the number of unique triangles in the ModelData.  A larger or smaller number of
    triangles may be rendered when the model is drawn because nodes and components of a model can
    be reused.
  ]],
  related = {
    'ModelData:getTriangle'
  }
}
