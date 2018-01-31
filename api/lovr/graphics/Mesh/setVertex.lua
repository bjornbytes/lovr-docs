return {
  summary = 'Update a single vertex in the Mesh.',
  description = 'Update a single vertex in the Mesh.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the vertex to set.'
    },
    ['...'] = {
      type = 'number',
      description = 'The attributes of the vertex.'
    },
    vertexData = {
      type = 'table',
      description = 'A table containing the attributes of the vertex.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'index', '...' },
      returns = {}
    },
    {
      arguments = { 'index', 'vertexData' },
      returns = {}
    }
  },
  notes = [[
    Any unspecified components will be set to 0 for float and int attributes, or 255 for byte
    attributes.
  ]],
  example = {
    description = 'Set the position of a vertex:',
    code = [[
      function lovr.load()
        mesh = lovr.graphics.newMesh({
          { -1, 1, 0,  0, 0, 1,  0, 0 },
          { 1, 1, 0,  0, 0, 1,  1, 0 },
          { -1, -1, 0,  0, 0, 1,  0, 1 },
          { 1, -1, 0,  0, 0, 1,  1, 1 }
        }, 'strip')

        mesh:setVertex(2, { 7, 7, 7 })
        print(mesh:getVertex(2)) -- 7, 7, 7, 0, 0, 0, 0, 0
      end
    ]]
  }
}
