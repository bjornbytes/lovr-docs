return {
  summary = 'Resume a task.',
  description = [[
    Resumes a task.  This is similar to `coroutine.resume`, but integrates with the task scheduler:

    - If the task was waiting on a result from an asynchronous function call, it passes the results
      from that call back to the task.
    - The task scheduler will track any async calls the task makes, yielding the task and tracking
      the progress of the async call.
    - If the task is still waiting on a pending async call, the task scheduler will refuse to resume
      the task.

    This function returns once the task yields, either because it called an async function, called
    `coroutine.yield`, finished running, or errored.
  ]],
  arguments = {
    ['...'] = {
      type = '*',
      description = [[
        Arguments to pass to the task, as the return values from `coroutine.yield`.  These are
        ignored if the task was waiting on an async call.
      ]]
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the task resumed and ran successfully.',
    },
    ['...'] = {
      type = '*',
      description = 'An error message, or the results from `coroutine.yield`.'
    }
  },
  variants = {
    {
      arguments = { '...' },
      returns = { 'success', '...' }
    }
  },
  notes = 'If the task is waiting on an async call, this function returns `false, \'not ready\'`.',
  related = {
    'lovr.task.start',
    'lovr.task.wait',
    'lovr.task.getStatus',
    'lovr.taskready'
  }
}
