return {
  summary = 'Get the vertex indices in the Mesh.',
  description = 'Returns a table with the Mesh\'s vertex indices.',
  arguments = {},
  returns = {
    t = {
      type = '{number}',
      description = 'A table of numbers with the 1-based vertex indices.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 't' }
    }
  },
  notes = 'This function returns `nil` if the mesh was created with `gpu` storage.',
  related = {
    'Mesh:getIndexBuffer',
    'Mesh:setIndexBuffer'
  }
}
