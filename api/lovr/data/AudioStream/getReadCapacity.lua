return {
  summary = 'Get the number of frames available for reading.',
  description = 'Returns the number of frames that are available for reading in the audio stream.',
  arguments = {},
  returns = {
    frames = {
      type = 'number',
      description = 'The number of audio frames that can be read.'
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
    'AudioStream:getWriteCapacity',
    'Sound:getFrameCount',
    'lovr.data.newAudioStream'
  }
}
