return {
  summary = 'Get the Pool\'s memory usage.',
  description = 'Returns the amount of memory current in use by the Pool.',
  arguments = {},
  returns = {
    {
      name = 'size',
      type = 'number',
      description = 'The size of the Pool.'
    }
  },
  notes = [[
    `Pool:drain` can be used to reset the usage to zero (and invalidate vectors that have been
    allocated from the Pool).
  ]],
  related = {
    'Pool:getSize',
    'Pool:drain'
  }
}
