return {
  summary = 'Get the file the Blob was loaded from.',
  description = [[
    Returns the name of the file used to load the Blob, or the custom name given to it when it was
    created.
  ]],
  arguments = {},
  returns = {
    {
      name = 'filename',
      type = 'string',
      description = 'The name of the Blob.'
    }
  }
}
