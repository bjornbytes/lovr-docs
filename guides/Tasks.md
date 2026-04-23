Tasks
===

LÖVR has a task system, allowing work to be spread across worker threads and run in the background.

Why
---

LÖVR renders graphics in realtime with tight frame deadlines.  Anything that takes more than a
couple of milliseconds risks dropping a frame, which is uncomfortable in VR.  Loading new assets at
runtime, making HTTP requests, or generating new level data are all common tasks that take a long
time.  These shouldn't block the thread doing the rendering.

It's already possible to use `Thread` and `Channel` to move these off the main thread, but there are
some downsides:

- It requires implementing a thread pool, which requires knowledge about multithreading and thread
  safety, or a library.
- `Thread` objects contend with LÖVR's internal worker threads.  Ideally, it would be possible to
  run work on LÖVR's thread pool instead.
- Using `Channel` objects for communication can lead to performance issues due to serialization
  overhead and lock contention, especially when lots of state needs to be sent between threads.
- Moving things to threads makes them asynchronous, and this comes with additional challenges.
  State needs to be exchanged between multiple threads, completion needs to be tracked and polled,
  and the launching and completion of the operation lives in different places.

The task system solves these problems.  Tasks allow slow operations to run in the background on
LÖVR's thread pool, without blocking the main thread.  Tasks use coroutines to make async code look
synchronous, eliminating a lot of the challenges associated with asynchronous programming.

Usage
---

The task system is in the `lovr.task` module.  Use `lovr.task.start` to start a new task:

    local task = lovr.task.start(function()
      -- Load a model without blocking main thread
      model = lovr.graphics.newModel('model.glb')
    end)

Tasks are regular coroutines.  `lovr.task.start` is a shortcut for creating a coroutine and resuming
it immediately in the task system.

    local task = coroutine.create(function()
      model = lovr.graphics.newModel('model.glb')
    end)

    lovr.task.resume(task)

Tasks share the same global scope with the main thread, so variables can be shared without sending
messages across `Channel` objects.

Asynchronous Functions
---

Certain LÖVR functions are "asynchronous" (async).  When an async function is called in a task, the
task yields immediately instead of blocking.  Once the result of the async call is ready, the task
will get resumed automatically with the result.  Because tasks yield immediately when they call an
async function, the main thread does not block.  Rendering can continue while the expensive work
happens in the background.

Calling an async function outside a task is fine, and will block until the result is ready.

For example, `lovr.graphics.newModel` is an async function:

    -- Blocks!
    model = lovr.graphics.newModel('model.glb')

    -- Does not block!  Loads model in background
    lovr.task.start(function()
      model = lovr.graphics.newModel('model.glb')
    end)

See the full [List of Async Functions](#list-of-async-functions) below.

Notably, `lovr.thread.call` calls a Lua function on a worker thread asynchronously, returning once
the call completes.  It can be used to effectively make any Lua function asynchronous, including
built-in LÖVR functions.

    -- Do an async raycast
    lovr.task.start(function()
      return lovr.thread.call(world.raycast, world, ...)
    end)

Waiting for Tasks
---

Normally, tasks resume automatically right before `lovr.update` on the frame they become ready.
However, it is also possible to wait for tasks to finish using `lovr.task.wait`.  This is useful if
the results are needed sooner, like on the same frame the task was started.

    ok, result = lovr.task.wait(task)

This will wait until the task has finished, and returns whatever its function returned.

During the wait, LÖVR will run the task, run jobs assigned to worker threads, or go to sleep if
there's nothing to do.

`lovr.task.wait` supports waiting for multiple tasks.

    ok, first, second, third = lovr.task.wait(a, b, c)

This uses the same rules Lua uses for collapsing multiple returns.  In the above example, `a` and
`b` will only return their first value, but `c` will return all of its values.

Note that `lovr.task.wait` is an async function, so waiting on a task from inside a task will not
block.  Instead, the waiter task will be resumed again once all of its dependencies are satisfied.

Custom Scheduling
---

By default, tasks are resumed immediately once they are ready, so it is not necessary to track task
state manually.  The `lovr.taskready` callback handles this behavior, and is called whenever a task
is ready to run after making an async call.  The default implementation just resumes the task and
throws errors, but it is possible to override it to implement custom scheduling or error handling
behavior:

    function lovr.taskready(task)
      assert(lovr.task.resume(task))
    end

LÖVR polls for ready tasks and gives them to `lovr.taskready` right before calling `lovr.update`.

This is great for "fire and forget" tasks.  Tasks can start and make asynchronous calls and they
will automatically resume on the next frame they are ready to proceed.

Tasks can also be resumed manually by checking their status and resuming them explicitly, though
this is niche:

    if task:getStatus() == 'ready' then
      lovr.task.resume(task)
    end

It's okay to resume a task with `coroutine.resume`, but any asynchronous calls it makes will block
instead of yielding.

Error Handling
---

If a task errors, the error is caught by `lovr.task.resume`:

    -- if ok is false, result will be the error message
    local ok, result = lovr.task.resume(task)

The default `lovr.taskready` implementation rethrows errors encountered while resuming the task.

`lovr.task.wait` behaves in a similar way.  It returns a success code, followed by its results.  If
any of the tasks error, it returns immediately with the first error encountered:

    local ok = lovr.task.wait(tasks)

Examples
---

Loading an asset in the background:

    function lovr.load()
      local task = lovr.task.start(function()
        texture = lovr.graphics.newTexture('image.png')
      end)
    end

    function lovr.draw(pass)
      if texture then
        -- Use texture
      else
        -- Not ready yet, show loading UI
        pass:text('Loading...')
      end
    end

Loading multiple assets in parallel:

    function lovr.load()
      local tasks = {}
      local files = {} -- some list of files to load

      for i, file in ipairs(files) do
        table.insert(tasks, lovr.task.start(function()
          return lovr.graphics.newTexture(file)
        end))
      end

      local success, textures = lovr.task.wait(tasks)
    end

Asynchronous GPU readbacks:

    function lovr.draw(pass)
      render(pass)

      if lovr.system.wasKeyPressed('s') then
        lovr.task.start(function()
          local image = pass:getCanvas()[1]:getPixels()
          lovr.filesystem.write('screenshot.png', image:encode())
        end)
      end
    end

Overlapping physics updates with garbage collection:

    function lovr.load()
      world = lovr.physics.newWorld()
    end

    function lovr.update(dt)
      -- Update physics world on background thread
      local task = lovr.task.start(lovr.thread.call, world.update, world, dt)

      -- Runs during physics update
      collectgarbage()

      -- Wait for physics update to finish
      lovr.task.wait(task)
    end

Timers:

    -- Wait 2 seconds, then do something
    lovr.task.start(function()
      lovr.timer.sleep(2)
      print('done!')
    end)

List of Async Functions
---

Asset loading:

- `lovr.audio.newSource`
- `lovr.data.newImage`
- `lovr.data.newModelData`
- `lovr.data.newSound`
- `lovr.graphics.newTexture`
- `lovr.graphics.newModel`
- `lovr.graphics.newShader`
- `lovr.graphics.compileShader`
- `lovr.headset.newModel`

GPU readbacks:

- `Buffer:newBlob`
- `Buffer:getData`
- `Texture:getPixels`

Timing:

- `lovr.timer.sleep`

Threads:

- `lovr.thread.call`

Tasks:

- `lovr.task.wait`
