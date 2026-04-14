return {
  summary = 'Get the size of the AudioStream ring buffer.',
  description = 'Returns the size of the AudioStream ring buffer, in frames.',
  arguments = {},
  returns = {
    capacity = {
      type = 'number',
      description = 'The number of audio frames in the audio stream ring buffer.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'capacity' }
    }
  },
  related = {
    'AudioStream:getReadCapacity',
    'AudioStream:getWriteCapacity',
    'Sound:getFrameCount',
    'lovr.data.newAudioStream'
  }
}
