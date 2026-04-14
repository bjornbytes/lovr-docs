return {
  summary = 'Get the number of frames available for writing.',
  description = 'Returns the number of frames that are available for writing in the audio stream.',
  arguments = {},
  returns = {
    frames = {
      type = 'number',
      description = 'The number of audio frames that can be written.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'frames' }
    }
  },
  related = {
    'AudioStream:getCapacity',
    'AudioStream:getReadCapacity',
    'Sound:getFrameCount',
    'lovr.data.newAudioStream'
  }
}
