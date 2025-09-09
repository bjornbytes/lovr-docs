return {
  tag = 'filesystem-files',
  summary = 'Create a directory.',
  description = [[
    Creates a directory in the save directory.  Also creates any intermediate directories that don't
    exist.
  ]],
  arguments = {
    path = {
      type = 'string',
      description = 'The directory to create, recursively.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the directory was created.'
    },
    error = {
      type = 'string | nil',
      description = 'The error message.'
    }
  },
  variants = {
    {
      arguments = { 'path' },
      returns = { 'success', 'error' }
    }
  }
}
