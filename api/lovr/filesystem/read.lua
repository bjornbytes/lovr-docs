return {
  tag = 'filesystem-files',
  summary = 'Read a file.',
  description = 'Read the contents of a file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The name of the file to read.'
    }
  },
  returns = {
    contents = {
      type = 'string | nil',
      description = 'The contents of the file, or nil if the file could not be read.'
    },
    error = {
      type = 'string | nil',
      description = 'The error message, if any.'
    }
  },
  variants = {
    {
      arguments = { 'filename' },
      returns = { 'contents', 'error' }
    }
  }
}
