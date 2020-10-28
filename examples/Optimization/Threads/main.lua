-- Code meant to run in a separate thread should generally be in its
--own file. The lovr and lovr module namespaces need to be required
--before they can be used in the new thread.
local threadCode = [[
if not lovr then lovr = require "lovr" end 
if not lovr.thread then lovr.thread = require "lovr.thread" end

local channel = lovr.thread.getChannel('channel')

while true do 
    local msg = channel:pop()
    if msg ~= nil then print(msg) end 
end
]]

function lovr.load()
    thread = lovr.thread.newThread(threadCode)
    -- Communicating with a new thread requires a channel
    channel = lovr.thread.getChannel('channel')
    thread:start()
end

function lovr.update() 
    channel:push("Hello World")
end