return {
  summary = 'Create a new Thread.',
  description = 'Creates a new Thread from Lua code.',
  arguments = {
    code = {
      type = 'string',
      description = 'The code to run in the Thread.'
    },
    filename = {
      type = 'string',
      description = 'A file containing code to run in the Thread.'
    },
    blob = {
      type = 'Blob',
      description = 'The code to run in the Thread.'
    }
  },
  returns = {
    thread = {
      type = 'Thread',
      description = 'The new Thread.'
    }
  },
  variants = {
    {
      arguments = { 'code' },
      returns = { 'thread' }
    },
    {
      arguments = { 'filename' },
      returns = { 'thread' }
    },
    {
      arguments = { 'blob' },
      returns = { 'thread' }
    }
  },
  notes = 'The Thread won\'t start running immediately.  Use `Thread:start` to start it.',
  related = {
    'Thread:start',
    'lovr.threaderror'
  }
}
