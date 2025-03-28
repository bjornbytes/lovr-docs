function lovr.load()
  -- This holds the thread code
  -- This must be wrapped with [[]] or '' to allow the engine to run it as Lua
  threadCode = [[
    local lovr = {}
    lovr.thread = require 'lovr.thread'
    lovr.timer = require 'lovr.timer'
    local channel = lovr.thread.getChannel('test')
    local x = 0
    while true do
      x = x + 1
      channel:push(x)
      lovr.timer.sleep(.1)
    end
  ]]

  -- Create a new test channel
  channel = lovr.thread.getChannel('test')

  -- Create a new thread called 'thread' using the code above
  thread = lovr.thread.newThread(threadCode)

  -- Start the thread
  thread:start()
end

function lovr.update(dt)
  -- Read and delete any messages in the queue
  while channel:peek() do
    message = channel:pop()
  end
end

function lovr.draw(pass)
  -- Display the message on screen/headset
  pass:text(tostring(message), 0, 1.7, -5)
end
