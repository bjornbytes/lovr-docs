return {
  tag = 'callbacks',
  summary = 'Called when restarting.',
  description = [[
    This callback is called when a restart from `lovr.event.restart` is happening.  A value can be
    returned to send it to the next LÖVR instance, available as the `restart` key in the argument
    table passed to `lovr.load`.  Object instances can not be used as the restart value, since they
    are destroyed as part of the cleanup process.
  ]],
  arguments = {},
  returns = {
    cookie = {
      type = '*',
      description = 'The value to send to the next `lovr.load`.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'cookie' }
    }
  },
  notes = 'The cookie can be a boolean, number, string, table, or lightuserdata.',
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
