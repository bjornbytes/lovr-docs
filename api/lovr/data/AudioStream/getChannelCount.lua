return {
  summary = 'Get the number of channels in the AudioStream.',
  description = 'Returns the number of channels in the AudioStream.',
  arguments = {},
  returns = {
    channels = {
      type = 'number',
      description = 'The number of channels.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'channels' }
    }
  },
  related = {
    'Sound:getChannelCount',
    'lovr.data.newAudioStream'
  }
}
