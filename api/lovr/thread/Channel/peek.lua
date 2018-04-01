return {
  summary = 'Look at a message from the Channel without popping it.',
  description = [[
    Returns a message from the Channel without popping it from the queue.  If the Channel is empty,
    `nil` is returned.  This can be useful to determine if the Channel is empty.
  ]],
  arguments = {},
  returns = {
    {
      name = 'message',
      type = '*',
      description = 'The message.'
    }
  },
  related = {
    'Channel:pop'
  }
}
