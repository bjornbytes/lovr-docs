return {
  summary = 'Create a new AudioStream.',
  description = 'Creates a new AudioStream from ogg data.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the audio file to load.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing audio data to decode.'
    },
    bufferSize = {
      type = 'number',
      default = '4096',
      description = 'The size of the stream\'s audio buffer.'
    }
  },
  returns = {
    audioStream = {
      type = 'AudioStream',
      description = 'The new AudioStream.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'bufferSize' },
      returns = { 'audioStream' }
    },
    {
      arguments = { 'blob', 'bufferSize' },
      returns = { 'audioStream' }
    }
  }
}
