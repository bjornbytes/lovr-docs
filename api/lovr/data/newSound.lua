return {
  summary = 'Create a new Sound.',
  description = [[
    Creates a new Sound.  A sound can be loaded from an audio file, or it can be created empty with
    capacity for a certain number of audio frames.

    When loading audio from a file, use the `decode` option to control whether compressed audio
    should remain compressed or immediately get decoded to raw samples.
  ]],
  arguments = {
    frames = {
      type = 'number',
      description = 'The number of frames the Sound can hold.'
    },
    format = {
      type = 'SampleFormat?',
      default = [['f32']],
      description = 'The sample data type.'
    },
    channels = {
      type = 'number?',
      description = 'The number of channels.'
    },
    sampleRate = {
      type = 'number?',
      default = '48000',
      description = 'The sample rate, in Hz.'
    },
    contents = {
      type = 'Blob?',
      description = 'An optional Blob containing raw audio samples to use as the initial contents.'
    },
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing a sound file to load.'
    },
    decode = {
      type = 'boolean?',
      default = 'false',
      description = 'Whether compressed audio files should be immediately decoded.'
    }
  },
  returns = {
    sound = {
      type = 'Sound',
      description = 'Sounds good.'
    }
  },
  variants = {
    {
      description = 'Create a Sound from a frame count and format info.',
      arguments = { 'frames', 'format', 'channels', 'sampleRate', 'contents' },
      returns = { 'sound' }
    },
    {
      description = [[
        Load a sound from a filename or Blob containing the data of an audio file.  Compressed audio
        formats (OGG, MP3) can optionally be decoded into raw sounds.

        If you want to load a Blob containing raw audio samples, use the first variant of this
        function and pass the Blob as the `contents`.
      ]],
      arguments = { 'file', 'decode' },
      returns = { 'sound' }
    }
  },
  notes = [[
    It is recommended to use an audio format that matches the format of the audio module: `f32`
    sample formats at a sample rate of 48000, with 1 channel for spatialized sources or 2 channels
    for unspatialized sources.  This will avoid the need to convert audio during playback, which
    improves performance of the audio thread slightly.

    The WAV importer supports 16, 24, and 32 bit integer data and 32 bit floating point data.  The
    data must be mono, stereo, or 4-channel full-sphere ambisonic.  The `WAVE_FORMAT_EXTENSIBLE`
    extension is supported.

    OGG and MP3 files will always have the `f32` format when loaded.

    Ambisonic sounds can be imported from WAV files.  They must be full-sphere ambisonic data with
    4, 9, or 16 channels.  If the WAV has a `WAVE_FORMAT_EXTENSIBLE` chunk with an
    `AMBISONIC_B_FORMAT` format GUID, then the data is understood as using the AMB format with
    Furse-Malham channel ordering and normalization.  *All other* 4-channel files are assumed to be
    using the AmbiX format with ACN channel ordering and SN3D normalization.  AMB files will get
    automatically converted to AmbiX on import, so ambisonic Sounds will always be AmbiX.
  ]]
}
