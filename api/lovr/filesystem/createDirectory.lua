return {
  tag = 'filesystem-files',
  summary = 'Create a directory.',
  description = [[
    Creates a directory in the save directory.  Any parent directories that don't exist will also be
    created.
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
    }
  },
  variants = {
    {
      arguments = { 'path' },
      returns = { 'success' }
    }
  }
}
