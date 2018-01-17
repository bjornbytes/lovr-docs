return {
  summary = 'Get the FilterMode for the Texture.',
  description = 'Returns the current FilterMode for the Texture.',
  arguments = {},
  returns = {
    {
      name = 'min',
      type = 'FilterMode',
      description = 'The filter mode used for minification.'
    },
    {
      name = 'mag',
      type = 'FilterMode',
      description = 'The filter mode used for magnification.'
    }
  }
}
