return {
  tag = 'sources',
  summary = 'Create a new Source.',
  description = 'Creates a new Source from an ogg file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the sound to load.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing the Source data.'
    },
    stream = {
      type = 'AudioStream',
      description = 'The AudioStream used to stream audio data to the Source.'
    }
  },
  returns = {
    source = {
      type = 'Source',
      description = 'The new Source.'
    }
  },
  variants = {
    {
      arguments = { 'filename' },
      returns = { 'source '}
    },
    {
      arguments = { 'blob' },
      returns = { 'source '}
    },
    {
      arguments = { 'stream' },
      returns = { 'source '}
    }
  }
}
