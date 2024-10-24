return {
  summary = 'Get the seek position of the file.',
  description = [[
    Returns the seek position of the file, which is where `File:read` and `File:write will
    read/write from.
  ]],
  arguments = {},
  returns = {
    offset = {
      type = 'number',
      description = 'The file offset, in bytes.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'offset' }
    }
  },
  related = {
    'File:seek'
  }
}
