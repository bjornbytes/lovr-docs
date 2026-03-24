return {
  summary = 'Set a single audio frame in the Sound.',
  description = 'Sets a single audio frame in the Sound.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the frame to set.'
    },
    ['...'] = {
      type = 'number',
      description = 'Audio samples.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'index', '...' },
      returns = {}
    }
  },
  notes = [[
    Sounds with a sample format of `f32` should have samples between -1 and 1.  For the `i16`
    format, samples should be between -32768 and 32767.
  ]],
  related = {
    'Sound:getFrames',
    'Sound:setFrames'
  }
}
