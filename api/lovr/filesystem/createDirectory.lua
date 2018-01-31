return {
  summary = 'Create a directory.',
  description = 'Creates a directory in the save directory.',
  arguments = {
    {
      name = 'path',
      type = 'string',
      description = 'The directory to create.'
    }
  },
  returns = {
    {
      name = 'success',
      type = 'boolean',
      description = 'Whether the directory was created.'
    }
  }
}
