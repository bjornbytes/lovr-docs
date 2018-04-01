return {
  summary = 'Create a new Thread.',
  description = 'Creates a new Thread from Lua code.',
  arguments = {
    {
      name = 'body',
      type = 'string',
      description = 'The code to run in the Thread.'
    }
  },
  returns = {
    {
      name = 'thread',
      type = 'Thread',
      description = 'The new Thread.'
    }
  },
  notes = 'The Thread won\'t start running immediately.  Use `Thread:start` to start it.',
  related = {
    'Thread:start',
    'lovr.threaderror'
  }
}
