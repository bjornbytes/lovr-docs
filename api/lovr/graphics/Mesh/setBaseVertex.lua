return {
  summary = 'Set the base vertex of the Mesh.',
  description = [[
    Sets the base vertex of the Mesh.  This is an offset added to index buffer values before reading
    the vertex from the vertex buffer.

    Adjusting the base vertex is useful for storing multiple indexed meshes in a single Mesh object.
    Rather than manually offsetting all of the index buffer values to account for the offset where
    each sub-mesh is stored, the base vertex can be changed instead.
  ]],
  arguments = {
    offset = {
      type = 'number?',
      default = '0',
      description = 'An offset applied to values in the index buffer during drawing.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'offset' },
      returns = {}
    }
  }
}
