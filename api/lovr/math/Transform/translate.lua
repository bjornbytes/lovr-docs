return {
  summary = 'Translate the Transform.',
  description = 'Translates the Transform.',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x component of the translation.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y component of the translation.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z component of the translation.'
    }
  },
  returns = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The original Transform.'
    }
  }
}
