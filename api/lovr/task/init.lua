return {
  tag = 'modules',
  summary = 'Coroutine scheduler.',
  description = [[
    The task module implements a task scheduler.  Tasks are Lua coroutines that can be yielded and
    resumed independently from each other, allowing multiple independent pieces of Lua code to run
    cooperatively.

    LÖVR also has a set of "asynchronous functions".  When one of these async functions is called in
    a task, the task will yield, and the scheduler will keep track of when the task is ready to
    resume again.  Then, while the original task is yielded and waiting for its result, other tasks
    can run, instead of blocking the CPU thread.  Work performed by async functions is also spread
    across multiple CPU cores automatically.  This allows a large number of expensive functions to
    all run at the same time, without using `Thread` or `Channel` objects.

    As a simple example, this code uses a task to load a texture on a background thread, then
    continues to render a loading message until the texture is ready.

        function lovr.load()
          task = lovr.task.start(function()
            -- Note: lovr.graphics.newTexture is async
            texture = lovr.graphics.newTexture('file.png')
          end)
        end

        function lovr.draw(pass)
          if not texture then
            pass:text('Loading texture...', 0, 1.7, -1)
          else
            pass:draw(texture, 0, 1.7, -1)
          end
        end
  ]],
  related = {
    'lovr.thread'
  }
}
