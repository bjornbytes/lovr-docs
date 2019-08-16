return {
  tag = 'window',
  summary = 'Stop a timer on the GPU.',
  description = 'Stops a named timer on the GPU, previously started with `lovr.graphics.tick`.',
  arguments = {
    {
      name = 'label',
      type = 'string',
      description = 'The name of the timer.'
    }
  },
  returns = {},
  notes = [[
    All drawing commands between the tick and the tock will be timed.  It is not possible to nest
    calls to tick and tock.

    The amount of time elapsed can be accessed from the `timers` field of `lovr.graphics.getStats`.
    Note that the results are delayed (because the GPU runs asynchronously), and may be `nil` if
    they are unavailable.
  ]],
  related = {
    'lovr.graphics.tick',
    'lovr.graphics.getStats'
  }
}
