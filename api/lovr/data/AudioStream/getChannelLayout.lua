return {
  summary = 'Get the channel layout of the AudioStream.',
  description = 'Returns the channel layout of the AudioStream.',
  arguments = {},
  returns = {
    layout = {
      type = 'ChannelLayout',
      description = 'The channel layout.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'layout' }
    }
  },
  related = {
    'Sound:getChannelLayout',
    'lovr.data.newAudioStream'
  }
}
