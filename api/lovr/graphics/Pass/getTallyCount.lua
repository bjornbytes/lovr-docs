return {
  tag = 'tally',
  summary = 'Get the number of tallies added to the Pass.',
  description = [[
    Returns the number of tallies that have been started and finished in the pass.  This doesn't
    return the result of the tallies, use `Pass:getTallyData` or `Pass:setTallyBuffer` for that.
  ]],
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of tallies in the pass.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  related = {
    'Pass:beginTally',
    'Pass:finishTally'
  }
}
