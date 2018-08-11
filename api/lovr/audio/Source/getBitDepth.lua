return {
  summary = 'Get the bit depth of the Source.',
  description = [[
    Returns the number of bits per sample in the Source.  This is a rough indicator of the
    resolution of the Source, and is usually 16.
  ]],
  arguments = {},
  returns = {
    {
      name = 'bits',
      type = 'number',
      description = 'The number of bits per sample.'
    }
  },
  related = {
    'SoundData:getBitDepth',
    'AudioStream:getBitDepth'
  }
}
