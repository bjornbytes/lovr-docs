return {
  summary = 'Call a Lua function on a worker thread.',
  description = [[
    Calls a Lua function on a worker thread.  The arguments and returns are sent to and from the
    thread using an internal Channel.  The function is serialized to bytecode, so it can not access
    any variables in the parent Lua scope.

    This is an asynchronous function.  Calling it in a task will yield the task and resume once the
    call is complete.
  ]],
  arguments = {
    f = {
      type = 'function',
      description = 'The function to call.'
    },
    ['...'] = {
      type = '*',
      description = 'Arguments to pass to the function.'
    }
  },
  returns = {
    ['...'] = {
      type = '*',
      description = 'Values returned by the function.'
    }
  },
  variants = {
    {
      arguments = { 'f', '...' },
      returns = { '...' }
    }
  },
  notes = [[
    C methods can be called this way:

        world = lovr.physics.newWorld()

        -- Do the physics update on a thread
        lovr.thread.call(world.update, world, dt)
  ]]
}
