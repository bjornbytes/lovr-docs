return {
  summary = 'Get the modification time of a file.',
  description = 'Returns when a file was last modified.',
  arguments = {
    {
      name = 'file',
      type = 'string',
      description = 'The file.'
    }
  },
  returns = {
    {
      name = 'time',
      type = 'number',
      description = 'The time when the file was last modified, in seconds.'
    }
  }
}
