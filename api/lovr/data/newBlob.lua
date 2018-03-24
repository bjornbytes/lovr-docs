return {
  summary = 'Create a new Blob.',
  description = 'Creates a new Blob.  A Blob is a piece of binary data.',
  arguments = {
    size = {
      type = 'number',
      description = [[
        The amount of data to allocate for the Blob, in bytes.  Its content will be set to zero.
      ]]
    },
    contents = {
      type = 'string',
      description = 'A string containing the Blob\'s contents.'
    },
    source = {
      type = 'Blob',
      description = 'A Blob to copy the contents from.'
    },
    name = {
      type = 'string',
      default = [['']],
      description = 'A name for the Blob (used in error messages)',
    }
  },
  returns = {
    blob = {
      type = 'Blob',
      description = 'The new Blob.'
    }
  },
  variants = {
    {
      arguments = { 'size', 'name' },
      returns = { 'blob' }
    },
    {
      arguments = { 'contents', 'name' },
      returns = { 'blob' }
    },
    {
      arguments = { 'source', 'name' },
      returns = { 'blob' }
    }
  },
  notes = [[
    Note that `VertexData` and `TextureData` are Blobs and can be cloned using this function.
  ]]
}
