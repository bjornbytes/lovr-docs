return {
  tag = 'tally',
  summary = 'Finish a tally.',
  description = [[
    Finishes a tally that was previously started with `Pass:beginTally`.  This will stop counting
    the number of pixels affected by draws.  The results for all the tallies in the pass can later
    be retrieved with `Pass:getTallyData`, or they can be saved to a `Buffer` with
    `Pass:setTallyBuffer`.
  ]],
  arguments = {},
  returns = {
    index = {
      type = 'number',
      description = 'The index of the tally that was finished.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'index' }
    }
  },
  notes = [[
    There is currently a maximum of 256 tallies per pass.

    If no tally is active, this function will error.
  ]],
  related = {
    'Pass:beginTally',
    'Pass:getTallyCount'
  }
}
