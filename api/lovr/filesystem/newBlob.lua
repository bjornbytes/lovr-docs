return {
  summary = 'Create a new Blob.',
  description = 'Creates a new Blob from a file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The file to load.'
    },
    str = {
      type = 'string',
      description = 'A string containing the Blob\'s contents.'
    },
    name = {
      type = 'string',
      description = 'A name for the Blob (used in error messages)',
    }
  },
  returns = {
    {
      name = 'blob',
      type = 'Blob',
      description = 'The new Blob.'
    }
  }
}
