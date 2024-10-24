return {
  summary = 'Check if the end of the file has been reached.',
  description = [[
    Returns whether the end of file has been reached.  When true, `File:read` will no longer return
    data.
  ]],
  arguments = {},
  returns = {
    eof = {
      type = 'boolean',
      description = 'Whether the end of the file has been reached.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'eof' }
    }
  },
  related = {
    'File:seek',
    'File:tell',
    'File:getSize'
  }
}
