return {
  summary = 'Get the location of the save directory.',
  description = 'Returns the absolute path to the save directory.',
  arguments = {},
  returns = {
    {
      name = 'path',
      type = 'string',
      description = 'The absolute path to the save directory.'
    }
  },
  related = {
    'lovr.filesystem.getIdentity',
    'lovr.filesystem.getAppdataDirectory'
  }
}
