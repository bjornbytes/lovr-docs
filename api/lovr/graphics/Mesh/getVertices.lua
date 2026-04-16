return {
  summary = 'Get the vertices in the Mesh.',
  description = 'Returns the vertices in the Mesh.',
  arguments = {
    index = {
      type = 'number',
      default = '1',
      description = 'The index of the first vertex to return.'
    },
    count = {
      type = 'number',
      default = 'nil',
      description = [[
        The number of vertices to return.  If nil, returns the "rest" of the vertices, based on the
        `index` argument.
      ]]
    }
  },
  returns = {
    vertices = {
      type = '{{number}}',
      description = [[
        A table of vertices.  Each vertex is a table of numbers for each vertex attribute, given by
        the vertex format of the Mesh.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'index', 'count' },
      returns = { 'vertices' }
    }
  },
  notes = 'This function returns `nil` if the mesh was created with `gpu` storage.',
  related = {
    'Mesh:getVertexBuffer',
    'Mesh:getVertexFormat',
    'Mesh:getIndices',
    'Mesh:setIndices'
  }
}
