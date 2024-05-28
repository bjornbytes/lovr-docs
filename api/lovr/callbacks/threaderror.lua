return {
  tag = 'callbacks',
  summary = 'Called when an error occurs in a thread.',
  description = [[
    The `lovr.threaderror` callback is called whenever an error occurs in a Thread.  It receives the
    Thread object where the error occurred and an error message.

    The default implementation of this callback will call `lovr.errhand` with the error.
  ]],
  arguments = {
    thread = {
      type = 'Thread',
      description = 'The Thread that errored.'
    },
    message = {
      type = 'string',
      description = 'The error message.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'thread', 'message' },
      returns = {}
    }
  },
  related = {
    'Thread',
    'Thread:getError',
    'lovr.errhand'
  }
}
