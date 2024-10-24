return {
  summary = 'Seek to a position in the file.',
  description = [[
    Seeks to a new position in the file.  `File:read` and `File:write` will read/write relative to
    this position.
  ]],
  arguments = {
    offset = {
      type = 'number',
      description = 'The new file offset, in bytes.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'offset' },
      returns = {}
    }
  },
  related = {
    'File:tell',
    'File:getSize'
  }
}
