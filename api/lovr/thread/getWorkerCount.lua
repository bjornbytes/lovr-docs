return {
  summary = 'Get the number of worker threads.',
  description = [[
    Returns the number of worker threads.  This is controlled by the `t.thread.workers` setting in
    `lovr.conf`.  By default, the number of workers is set to the number of CPU cores minus one (the
    main thread is considered a worker too).
  ]],
  arguments = {},
  returns = {
    workers = {
      type = 'number',
      description = 'The number of workers.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'workers' }
    }
  },
  notes = [[
    LÖVR uses worker threads internally to parallelize some work, including physics, asset loading,
    and graphics.  Additionally, custom Lua code can be offloaded to worker threads using
    `lovr.thread.call`, and any asynchronous function called in a task will run on a worker thread.
  ]],
  related = {
    'lovr.conf',
    'lovr.system.getCoreCount'
  }
}
