return {
  tag = 'tally',
  summary = 'Begin a tally.',
  description = [[
    Begins a new tally.  The tally will count the number of pixels touched by any draws that occur
    while the tally is active.  The results for all the tallies in the pass can later be retrieved
    with `Pass:getTallyData`, or they can be saved to a `Buffer` with `Pass:setTallyBuffer`.
  ]],
  arguments = {},
  returns = {
    index = {
      type = 'number',
      description = 'The index of the tally that was started.'
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

    If a tally is already active, this function will error.
  ]],
  related = {
    'Pass:finishTally',
    'Pass:getTallyCount'
  }
}
