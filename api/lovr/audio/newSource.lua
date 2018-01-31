return {
  tag = 'sources',
  summary = 'Create a new Source.',
  description = 'Creates a new Source from an ogg file.',
  arguments = {
    {
      name = 'filename',
      type = 'string',
      description = 'The filename of the sound to load.'
    }
  },
  returns = {
    {
      name = 'source',
      type = 'Source',
      description = 'The new Source.'
    }
  }
}
