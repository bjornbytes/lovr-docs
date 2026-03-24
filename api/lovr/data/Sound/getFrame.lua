return {
  summary = 'Get a single audio frame in the Sound.',
  description = 'Returns a single audio frame in the Sound.',
  arguments = {
    offset = {
      type = 'number',
      description = 'An offset in the sound to read from (0 is the first frame).'
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
      arguments = { 'offset' },
      returns = { '...' }
    }
  },
  related = {
    'Sound:getFrames',
    'Sound:setFrames'
  }
}
