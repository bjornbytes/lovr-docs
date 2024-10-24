return {
  summary = 'Read data from the file.',
  description = 'Reads data from the file.',
  arguments = {
    bytes = {
      type = 'number',
      description = [[
        The number of bytes to read from the file, or `nil` to read the rest of the
        file.
      ]]
    }
  },
  returns = {
    data = {
      type = 'string',
      description = 'The data that was read, or nil if an error occurred.'
    },
    size = {
      type = 'number',
      description = 'The number of bytes that were read, or the error message if an error occurred.'
    }
  },
  variants = {
    {
      arguments = { 'bytes' },
      returns = { 'data', 'size' }
    }
  },
  notes = [[
    The file must have been opened for reading.

    The maximum number of bytes that can be read at a time is 2^53 - 1.
  ]],
  related = {
    'File:write',
    'lovr.filesystem.read',
    'lovr.filesystem.newBlob'
  }
}
