return {
  tag = 'callbacks',
  summary = 'Called when restarting.',
  description = [[
    This callback is called right before the application is about to restart.  A value can be
    returned to send it to the next LÖVR instance, available as the `restart` key in the argument
    table passed to `lovr.load`.  Object instances can not be used as the restart value, since they
    are destroyed as part of the cleanup process.
  ]],
  arguments = {},
  returns = {
    {
      type = '*',
      name = 'abort',
      description = 'Whether quitting should be aborted.'
    }
  },
  notes = [[
    Only nil, booleans, numbers, and strings are supported types for the return value.
  ]],
  example = [[
    function lovr.restart()
      return currentLevel:getName()
    end
  ]],
  related = {
    'lovr.event.restart',
    'lovr.load',
    'lovr.quit'
  }
}
