return {
  summary = 'Write data to the file.',
  description = 'Writes data to the file.',
  arguments = {
    string = {
      type = 'string',
      description = 'A string to write to the file.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing data to write to the file.'
    },
    size = {
      type = 'number',
      default = 'nil',
      description = [[
        The number of bytes to write, or nil to write all of the data from the string/Blob.
      ]]
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the data was successfully written.'
    },
    message = {
      type = 'string',
      description = 'The error message.'
    }
  },
  variants = {
    {
      arguments = { 'string', 'size' },
      returns = { 'success', 'message' }
    },
    {
      arguments = { 'blob', 'size' },
      returns = { 'success', 'message' }
    }
  },
  notes = [[
    The maximum number of bytes that can be written at a time is 2^53 - 1.

    Use `File:seek` to control where the data is written.
  ]],
  related = {
    'File:read',
    'lovr.filesystem.write',
    'lovr.filesystem.append'
  }
}
