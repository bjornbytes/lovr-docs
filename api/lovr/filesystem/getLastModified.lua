return {
  tag = 'filesystem-files',
  summary = 'Get the modification time of a file.',
  description = 'Returns when a file was last modified, since some arbitrary time in the past.',
  arguments = {
    path = {
      type = 'string',
      description = 'The file to check.'
    }
  },
  returns = {
    time = {
      type = 'number | nil',
      description = 'The modification time of the file, in seconds, or `nil` if there was an error.'
    },
    error = {
      type = 'string | nil',
      description = 'The error message, if there was an error.'
    }
  },
  variants = {
    {
      arguments = { 'path' },
      returns = { 'time', 'error' }
    }
  }
}
