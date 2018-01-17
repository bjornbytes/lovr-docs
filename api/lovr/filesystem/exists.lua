return {
  summary = 'Check whether a file exists.',
  description = 'Determine if a file exists.',
  arguments = {
    {
      name = 'path',
      type = 'string',
      description = 'The path to check.'
    }
  },
  returns = {
    {
      name = 'exists',
      type = 'boolean',
      description = 'Whether the path is a file or directory.'
    }
  },
  notes = 'This function checks both the source directory and the save directory.'
}
