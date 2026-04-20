return {
  tag = 'callbacks',
  summary = 'Called when a task is ready to run.',
  description = [[
    The `lovr.taskready` callback is called when a task is ready to run after making an async call.

    The default implementation is to resume it, but this can be overidden to customize the
    task scheduling behavior.
  ]],
  arguments = {
    task = {
      type = 'thread',
      description = 'The task.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'task' },
      returns = {}
    }
  },
  example = [[
    function lovr.taskready(task)
      assert(lovr.task.resume(task))
    end
  ]],
  related = {
    'lovr.task.poll',
    'lovr.task.resume',
    'lovr.task.wait',
    'lovr.task.getStatus'
  }
}
