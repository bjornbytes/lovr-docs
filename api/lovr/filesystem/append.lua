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
      type = 'string',
      description = 'A string to write to the end of the file.'
    },
    blob = {
      type = 'Blob',
      description = 'A Blob containing data to append to the file.'
    }
  },
  returns = {
    success = {
      type = 'number',
      description = 'Whether the operation was successful.'
    },
    error = {
      type = 'string',
      description = 'The error message, if there was an error.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'content' },
      returns = { 'success', 'error' }
    },
    {
      arguments = { 'filename', 'blob' },
      returns = { 'success', 'error' }
    }
  },
  notes = 'If the file does not exist, it is created.'
}
