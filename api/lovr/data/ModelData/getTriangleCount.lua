return {
  summary = 'Get the total number of triangles in the model.',
  description = [[
    Returns the total number of triangles in the model.  This count includes meshes that are
    attached to multiple nodes, and the count corresponds to the triangles returned by
    `ModelData:getTriangles`.
  ]],
  arguments = {},
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The total number of triangles in the model.'
    }
  },
  related = {
    'ModelData:getTriangles',
    'ModelData:getVertexCount',
    'Model:getTriangleCount'
  }
}
