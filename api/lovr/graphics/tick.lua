return {
  tag = 'window',
  summary = 'Start a timer on the GPU.',
  description = 'Starts a named timer on the GPU, which can be stopped using `lovr.graphics.tock`.',
  arguments = {
    {
      name = 'label',
      type = 'string',
      description = 'The name of the timer.'
    }
  },
  returns = {},
  notes = [[
    The timer can be stopped by calling `lovr.graphics.tock` using the same name.  All drawing
    commands between the tick and the tock will be timed.  It is not possible to nest calls to tick
    and tock.

    The amount of time elapsed can be accessed from the `timers` field of `lovr.graphics.getStats`.
    Note that the results are delayed (because the GPU runs asynchronously), and may be `nil` if
    they are unavailable.
  ]],
  related = {
    'lovr.graphics.tock',
    'lovr.graphics.getStats'
  }
}
