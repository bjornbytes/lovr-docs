return {
  summary = 'TODO',
  description = 'TODO',
  arguments = {
    node = {
      type = 'number',
      description = 'The index of the node.'
    },
    name = {
      type = 'string',
      description = 'The name of the node.'
    },
    index = {
      type = 'number',
      description = 'The index of the draw.'
    }
  },
  returns = {
    mode = {
      type = 'MeshMode',
      description = 'Whether the vertices are points, lines, or triangles.'
    },
    material = {
      type = 'Material',
      description = 'The Material used by the draw.'
    },
    start = {
      type = 'number',
      description = 'The offset of the first vertex in the draw.'
    },
    count = {
      type = 'number',
      description = 'The number of vertices in the draw.'
    },
    base = {
      type = 'number',
      description = [[
        The base vertex of the draw (added to each instance value), or nil if the draw does not use
        an index buffer.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'node', 'index' },
      returns = { 'mode', 'material', 'start', 'count', 'base' }
    },
    {
      arguments = { 'name', 'index' },
      returns = { 'mode', 'material', 'start', 'count', 'base' }
    }
  },
  related = {
    'Pass:setMeshMode',
    'Pass:setMaterial',
    'Pass:mesh',
    'Model:getVertexBuffer',
    'Model:getIndexBuffer'
  }
}
