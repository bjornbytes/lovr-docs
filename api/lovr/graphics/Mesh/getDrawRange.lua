return {
  summary = 'Get the range of vertices drawn by the Mesh.',
  description = [[
    Returns the range of vertices drawn by the Mesh.  If different sets of mesh data are stored in a
    single Mesh object, the draw range can be used to select different sets of vertices to render.
  ]],
  arguments = {},
  returns = {
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
  variants = {
    {
      arguments = {},
      returns = { 'start', 'count', 'offset' }
    },
    {
      description = 'This function returns nothing if no draw range is set.',
      arguments = {},
      returns = {}
    }
  },
  related = {
    'Mesh:setIndices'
  }
}
