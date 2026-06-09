return {
  tag = 'system-window',
  summary = 'Poll the OS for new window events.',
  description = [[
    Fills the event queue with unprocessed events from the operating system.  This function should
    be called often, otherwise the operating system will consider the application unresponsive.
    This function is called in the default implementation of `lovr.run`, and the events are later
    processed by `lovr.event.poll`.
  ]],
  arguments = {
    timeout = {
      type = 'number',
      default = '0',
      description = [[
        How long to wait for an event to arrive, in seconds.  Use a negative value or `math.huge`
        for an infinite timeout, sleeping until an event arrives.  This is useful for an interface
        that only needs to re-render after a user input event occurs.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'timeout' },
      returns = {}
    }
  },
  notes = [[
    When using a timeout, this function will only return upon receiving a *window* event.  Other
    events like `filechanged`, `threaderror`, or events from `lovr.headset` will **not** wake up!
  ]],
  related = {
    'lovr.event.poll'
  }
}
