return {
  summary = 'Get one of the vertex indices in a mesh.',
  description = [[
    Returns one of the vertex indices in a mesh.  If a mesh has vertex indices, they define the
    order and connectivity of the vertices in the mesh, allowing a vertex to be reused multiple
    times without duplicating its data.
  ]],
  arguments = {
    {
      name = 'mesh',
      type = 'number',
      description = 'The index of a mesh to get the vertex from.'
    },
    {
      name = 'index',
      type = 'number',
      description = 'The index of a vertex index in the mesh to retrieve.'
    }
  },
  returns = {
    {
      name = 'vertexindex',
      type = 'number',
      description = 'The vertex index.  Like all indices in Lua, this is 1-indexed.'
    }
  },
  related = {
    'ModelData:getMeshIndexFormat',
    'ModelData:getMeshIndexCount',
    'ModelData:getMeshVertex',
    'ModelData:getTriangles'
  }
}
