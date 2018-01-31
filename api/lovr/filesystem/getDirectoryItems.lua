return {
  summary = 'Get a list of files in a directory..',
  description = 'Returns an unsorted table containing all files and subfolders in a directory.',
  arguments = {
    {
      name = 'path',
      type = 'string',
      description = 'The directory.'
    }
  },
  returns = {
    {
      name = 'table',
      type = 'items',
      description = 'A table with a string for each file and subfolder in the directory.'
    }
  }
}
