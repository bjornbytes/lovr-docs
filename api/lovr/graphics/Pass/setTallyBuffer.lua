return {
  tag = 'tally',
  summary = 'Set the Buffer that tally results will be written to.',
  description = [[
    Sets the Buffer where tally results will be written to.  Each time the render pass finishes, the
    results of all the tallies will be copied to the Buffer at the specified offset.  The buffer can
    be used in a later pass in a compute shader, or the data in the buffer can be read back using
    e.g. `Buffer:newReadback`.
  ]],
  arguments = {
    buffer = {
      type = 'Buffer',
      description = 'The buffer.'
    },
    offset = {
      type = 'number',
      description = 'An offset in the buffer where results will be written.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'buffer', 'offset' },
      returns = {}
    }
  },
  related = {
    'Pass:beginTally',
    'Pass:finishTally'
  }
}
