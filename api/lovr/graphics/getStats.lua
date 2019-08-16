return {
  tag = 'graphicsState',
  summary = 'Get renderer stats for the current frame.',
  description = 'Returns graphics-related performance statistics for the current frame.',
  arguments = {},
  returns = {
    {
      name = 'stats',
      type = 'table',
      description = 'The table of stats.',
      table = {
        {
          name = 'drawcalls',
          type = 'number',
          description = 'The number of draw calls.'
        },
        {
          name = 'shaderswitches',
          type = 'number',
          description = 'The number of times the shader has been switched.'
        },
        {
          name = 'timers',
          type = 'table',
          description = [[
            A table containing the timer results from calls to `lovr.graphics.tick` and
            `lovr.graphics.tock`.  The results are unreliable and may be `nil`.  The units are in
            seconds.
          ]]
        }
      }
    }
  }
}
