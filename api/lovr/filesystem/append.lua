return {
  tag = 'filesystem-files',
  summary = 'Append content to the end of a file.',
  description = 'Appends content to the end of a file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The file to append to.'
    },
    content = {
      type = 'string | Blob',
      description = 'A string or Blob to append to the file.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the operation was successful.'
    },
    error = {
      type = 'string | nil',
      description = 'The error message, or `nil` if there was no error.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'content' },
      returns = { 'success', 'error' }
    }
  },
  notes = 'If the file does not exist, it is created.'
}
