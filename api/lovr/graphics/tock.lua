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

    GPU timers are not supported on all systems.  Check the `timers` feature using
    `lovr.graphics.getFeatures` to see if it is supported on the current system.
  ]],
  example = [[
    function lovr.draw()
      lovr.graphics.tick('mytimer')

      -- Draw a bunch of cubes
      for x = -4, 4 do
        for y = -4, 4 do
          for z = -4, 4 do
            lovr.graphics.cube('fill', x, y, z, .2)
          end
        end
      end

      lovr.graphics.tock('mytimer')

      local stats = lovr.graphics.getStats()
      if stats.timers.mytimer then
        print('rendering took ' .. stats.timers.mytimer .. ' seconds')
      end
    end
  ]],
  related = {
    'lovr.graphics.tick',
    'lovr.graphics.getStats'
  }
}
