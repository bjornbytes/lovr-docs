return {
  summary = 'Get a single audio frame in the Sound.',
  description = 'Returns a single audio frame in the Sound.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the frame to get.'
    }
  },
  returns = {
    ['...'] = {
      type = 'number',
      description = 'The frame of audio, with 1 number for each channel.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { '...' }
    }
  },
  related = {
    'Sound:getFrames',
    'Sound:setFrames'
  }
}
