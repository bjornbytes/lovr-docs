return {
  summary = 'Get the status of a task.',
  description = 'Returns the status of a task.',
  arguments = {
    task = {
      type = 'thread',
      description = 'The task to check.'
    }
  },
  returns = {
    status = {
      type = 'string | nil',
      description = 'The status of the task.'
    }
  },
  variants = {
    {
      arguments = { 'task' },
      returns = { 'status' }
    }
  },
  notes = [[
    Status will be one of:

    - `running` - The current running task.
    - `complete` - The task function returned without error.
    - `failed` - The task threw an error.
    - `waiting` - The task is waiting on an async call.
    - `ready` - The task is ready to resume.
    - nil - The task is not tracked by the task scheduler.
  ]]
}
