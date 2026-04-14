return {
  summary = 'Get the sample format of the AudioStream.',
  description = 'Returns the sample format of the AudioStream.',
  arguments = {},
  returns = {
    format = {
      type = 'SampleFormat',
      description = 'The sample format.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'format' }
    }
  },
  related = {
    'Sound:getFormat',
    'lovr.data.newAudioStream'
  }
}
