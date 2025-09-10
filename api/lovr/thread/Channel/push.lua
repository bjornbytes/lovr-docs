return {
  summary = 'Push a message onto the Channel.',
  description = [[
    Pushes a message onto the Channel.  The following types of data can be pushed: nil, boolean,
    number, string, table, lightuserdata, vectors, and userdata (LÖVR objects).
  ]],
  arguments = {
    message = {
      type = '*',
      description = 'The message to push.'
    },
    wait = {
      type = 'number | boolean',
      default = 'false',
      description = [[
        How long to wait for the message to be popped, in seconds.  `true` can be used to wait
        forever and `false` can be used to avoid waiting.
      ]]
    }
  },
  returns = {
    id = {
      type = 'number',
      description = 'The ID of the pushed message.'
    },
    read = {
      type = 'boolean',
      description = 'Whether the message was read by another thread before the wait timeout.'
    }
  },
  variants = {
    {
      arguments = { 'message', 'wait' },
      returns = { 'id', 'read' }
    }
  },
  notes = 'Threads can get stuck forever waiting on Channel messages, so be careful.',
  related = {
    'Channel:pop',
    'Channel:hasRead'
  }
}
