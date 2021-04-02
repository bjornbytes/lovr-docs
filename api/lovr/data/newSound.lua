return {
  summary = 'Create a new Sound.',
  description = 'Creates a new Sound.',
  arguments = {
    frames = {
      type = 'number',
      description = 'The number of frames the Sound can hold.'
    },
    format = {
      type = 'SampleFormat',
      default = [['f32']],
      description = 'The sample data type.'
    },
    channels = {
      type = 'ChannelLayout',
      default = [['stereo']],
      description = 'The channel layout.'
    },
    sampleRate = {
      type = 'number',
      default = '48000',
      description = 'The sample rate, in Hz.'
    },
    contents = {
      type = '*',
      default = 'nil',
      description = [[
        A Blob containing raw audio samples to use as the initial contents, 'stream' to create an
        audio stream, or `nil` to leave the data initialized to zero.
      ]]
    },
    filename = {
      type = 'string',
      description = 'The filename of a sound to load.'
    },
    blob = {
      type = 'string',
      description = 'The Blob containing audio file data to load.'
    },
    decode = {
      type = 'boolean',
      description = 'Whether compressed audio files should be immediately decoded.'
    }
  },
  returns = {
    sound = {
      type = 'Sound',
      description = 'The new Sound.'
    }
  },
  variants = {
    {
      description = 'Create a raw or stream Sound from a frame count and format info.',
      arguments = { 'frames', 'format', 'channels', 'sampleRate', 'contents' },
      returns = { 'sound' }
    },
    {
      description = [[
        Load a sound from a file.  Compressed audio formats (OGG, MP3) can optionally be decoded
        into raw sounds.
      ]],
      arguments = { 'filename', 'decode' },
      returns = { 'sound' }
    },
    {
      description = [[
        Load a sound from a Blob containing the data of an audio file.  Compressed audio formats
        (OGG, MP3) can optionally be decoded into raw sounds.

        If the Blob contains raw audio samples, use the first variant instead of this one.
      ]],
      arguments = { 'blob', 'decode' },
      returns = { 'sound' }
    }
  }
}
