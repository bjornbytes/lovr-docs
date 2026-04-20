return {
  summary = 'Iterate over tasks that are ready to run.',
  description = [[
    This function returns a Lua iterator for all of the tasks that areready to run.  This function
    is called in the default implementation of `lovr.run`, so it's normally not necessary to call
    it manually.
  ]],
  arguments = {},
  returns = {
    iterator = {
      type = 'function',
      arguments = {},
      returns = {},
      description = 'The iterator function, usable in a for loop.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'iterator' }
    }
  },
  example = [[
    for task in lovr.task.poll() do
      assert(lovr.task.resume(task))
    end
  ]]
}
