return {
  summary = 'Wait for tasks to complete.',
  description = [[
    Waits for one or more tasks to complete, returning any values they return.

    Note that this is an async function.  Waiting on a task while inside another task will yield
    the waiter until the waitee is done.
  ]],
  arguments = {
    ['...task'] = {
      type = 'thread',
      description = 'Tasks to wait for.'
    },
    t = {
      type = '{thread}',
      description = 'A table of tasks to wait for.'
    }
  },
  returns = {
    ['...'] = {
      type = '*',
      description = [[
        The values the tasks returned.  This follows the same rules as Lua for collapsing multiple
        return values: the first return value of each function is used, except for the last
        function, which gets to return all of its results.
      ]]
    }
  },
  variants = {
    {
      arguments = { '...task' },
      returns = { '...' }
    },
    {
      arguments = { 't' },
      returns = { '...' }
    }
  },
  notes = [[
    After waiting on a task, it will not show up in `lovr.taskready`, since it will never be ready
    to run again.

    Waiting on a task requires that it was resumed with `lovr.task.resume`.

    If some of the tasks aren't finished yet when this function is called, LÖVR will try to find
    something useful to do, including resuming tasks that are ready to run and running some of the
    work that tasks are waiting for.
  ]],
  examples = {
    {
      description = 'Loading multiple images in parallel.',
      code = [[
        local tasks = {}

        for i, file in ipairs(files) do
          tasks[i] = lovr.task.start(function()
            return lovr.graphics.newTexture(file)
          end)
        end

        local textures = lovr.task.wait(tasks)
      ]]
    },
    {
      description = 'Multiple return values.',
      code = [[
        local a = lovr.task.start(function()
          return 1, 2, 3
        end)

        local b = lovr.task.start(function()
          return 4, 5, 6
        end)

        local c = lovr.task.start(function()
          return 7, 8, 9
        end)

        print(lovr.task.wait(a, b, c)) --> true, 1, 4, 7, 8, 9
      ]]
    }
  }
}
