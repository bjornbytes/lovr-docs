return {
  summary = 'Get the sample rate of the AudioStream.',
  description = 'Returns the sample rate of the AudioStream.',
  arguments = {},
  returns = {
    rate = {
      type = 'number',
      description = 'The sample rate, in Hz (samples per second).'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'rate' }
    }
  },
  related = {
    'Sound:getSampleRate',
    'lovr.data.newAudioStream'
  }
}
