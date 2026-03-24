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
  notes = [[
    Sounds with a sample format of `f32` will have samples between -1 and 1.  For the `i16` format,
    samples will be between -32768 and 32767.
  ]],
  related = {
    'Sound:getFrames',
    'Sound:setFrames'
  }
}
