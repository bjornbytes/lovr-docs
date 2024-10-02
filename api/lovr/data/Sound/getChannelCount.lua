return {
  summary = 'Get the number of channels in the Sound.',
  description = [[
    Returns the number of channels in the Sound.  Mono sounds have 1 channel, stereo sounds have 2
    channels, and ambisonic sounds have 4 channels.
  ]],
  arguments = {},
  returns = {
    channels = {
      type = 'number',
      description = 'The number of channels in the sound.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'channels' }
    }
  },
  related = {
    'Sound:getChannelLayout',
    'Sound:getByteStride'
  }
}
