return {
  summary = 'Get the Blob\'s contents as a string.',
  description = 'Returns a binary string containing the Blob\'s data.',
  arguments = {
    offset = {
      type = 'number',
      default = '0',
      description = 'A byte offset into the Blob where the string will start.'
    },
    size = {
      type = 'number',
      default = 'nil',
      description = [[
        The number of bytes the string will contain.  If nil, the rest of the data in the Blob will
        be used, based on the `offset` parameter.
      ]]
    }
  },
  returns = {
    data = {
      type = 'string',
      description = 'The Blob\'s data.'
    }
  },
  variants = {
    {
      arguments = { 'offset', 'size' },
      returns = { 'data' }
    }
  },
  example = {
    description = 'Manually copy a file using Blobs:',
    code = [[
      blob = lovr.filesystem.newBlob('image.png')
      lovr.filesystem.write('copy.png', blob:getString())
    ]]
  }
}
