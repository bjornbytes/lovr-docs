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
    soundData = {
      type = 'SoundData',
      description = 'The SoundData containing raw audio samples to play.'
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
      returns = { 'source' }
    },
    {
      arguments = { 'blob' },
      returns = { 'source' }
    },
    {
      arguments = { 'soundData' },
      returns = { 'source' }
    }
  }
}
