return {
  summary = 'Update a single vertex in the VertexData.',
  description = 'Update a single vertex in the VertexData.',
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
  ]]
}
