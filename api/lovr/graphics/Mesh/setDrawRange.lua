return {
  summary = 'Set the range of vertices drawn by the Mesh.',
  description = [[
    Sets the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a
    single Mesh object, the draw range can be used to select different sets of vertices to render.
  ]],
  arguments = {
    start = {
      type = 'number',
      description = [[
        The index of the first vertex that will be drawn (or the first index, if the Mesh has vertex
        indices).
      ]]
    },
    count = {
      type = 'number',
      description = [[
        The number of vertices that will be drawn (or indices, if the Mesh has vertex indices).
      ]]
    },
    offset = {
      type = 'number',
      description = [[
        When the Mesh has vertex indices, an offset that will be added to the index values before
        fetching the corresponding vertex.  This is ignored if the Mesh does not have vertex
        indices.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'start', 'count', 'offset' },
      returns = {}
    },
    {
      description = 'Disable the draw range.  The Mesh will draw all of its vertices.',
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    When using an index buffer, the draw range defines a range of indices to render instead of a
    range of vertices.  Additionally, a vertex offset can be set, which is added to the values in
    the index buffer before fetching the vertices.  This makes it easier to pack multiple sets of
    indexed mesh data in a single Mesh object, without having to manually offset the data in each
    index buffer.
  ]],
  related = {
    'Mesh:setIndices'
  }
}
