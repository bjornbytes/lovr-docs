return {
  summary = 'Read a file.',
  description = 'Read the contents of a file.',
  arguments = {
    {
      name = 'filename',
      type = 'string',
      description = 'The name of the file to read.'
    }
  },
  returns = {
    {
      name = 'contents',
      type = 'string',
      description = 'The contents of the file.'
    }
  },
  notes = 'If the file does not exist or cannot be read, an error is thrown.'
}
