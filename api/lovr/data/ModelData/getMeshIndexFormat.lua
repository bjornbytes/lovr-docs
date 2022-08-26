return {
  summary = 'Get the data format of vertex indices in a mesh.',
  description = [[
    Returns the data format of vertex indices in a mesh.  If a mesh doesn't use vertex indices, this
    function returns nil.
  ]],
  arguments = {
    {
      name = 'mesh',
      type = 'number',
      description = 'The index of a mesh.'
    }
  },
  returns = {
    {
      name = 'type',
      type = 'AttributeType',
      description = 'The data type of each vertex index (always u16 or u32).'
    },
    {
      name = 'blob',
      type = 'number',
      description = 'The index of a Blob in the mesh where the binary data is stored.'
    },
    {
      name = 'offset',
      type = 'number',
      description = 'A byte offset into the Blob\'s data where the index data starts.'
    },
    {
      name = 'stride',
      type = 'number',
      description = [[
        The number of bytes between subsequent vertex indices.  Indices are always tightly packed,
        so this will always be 2 or 4 depending on the data type.
      ]]
    }
  },
  related = {
    'ModelData:getMeshVertexFormat'
  }
}
