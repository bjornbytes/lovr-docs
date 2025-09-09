return {
  tag = 'filesystem-files',
  summary = 'Get the size of a file.',
  description = 'Returns the size of a file, in bytes.',
  arguments = {
    file = {
      type = 'string',
      description = 'The file.'
    }
  },
  returns = {
    size = {
      type = 'number | nil',
      description = 'The size of the file, in bytes, or `nil` if there was an error.'
    },
    error = {
      type = 'string | nil',
      description = 'The error message, if the operation was not successful.'
    }
  },
  variants = {
    {
      arguments = { 'file' },
      returns = { 'size', 'error' }
    }
  },
  notes = 'If the file does not exist, an error is thrown.',
  related = {
    'File:getSize'
  }
}
