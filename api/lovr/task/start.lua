return {
  summary = 'Start a task.',
  description = [[
    Starts a new task.  This creates a new coroutine and resumes it with `lovr.task.resume`:

        local task = coroutine.create(f)
        task:resume(...)
        return task
  ]],
  arguments = {
    f = {
      type = 'function',
      description = 'The function used for the coroutine body.'
    },
    ['...'] = {
      type = '*',
      description = 'Arguments to pass to the task.'
    }
  },
  returns = {
    task = {
      type = 'thread',
      description = 'The new task.'
    }
  },
  variants = {
    {
      arguments = { 'f', '...' },
      returns = { 'task' }
    }
  },
  related = {
    'lovr.task.resume'
  }
}
