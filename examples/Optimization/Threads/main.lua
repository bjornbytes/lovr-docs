-- Code meant to run in a separate thread should generally be in its
--own file. The lovr and lovr module namespaces need to be required
--before they can be used in the new thread.
local threadCode = [[
if not lovr then lovr = require "lovr" end 
if not lovr.thread then lovr.thread = require "lovr.thread" end

local toThread = lovr.thread.getChannel('to')
local fromThread = lovr.thread.getChannel('from')
local messageCount = 0

while true do 
    local msg = toThread:pop()
    if msg ~= nil then 
        print(msg) 
        messageCount = messageCount + 1
        fromThread:push(messageCount)
    end 
end
]]

function lovr.load()
    thread = lovr.thread.newThread(threadCode)
    -- Communicating with a new thread requires a channel.
    --To avoid congestion, it's a good idea to have several channels
    toThread = lovr.thread.getChannel('to')
    fromThread = lovr.thread.getChannel('from')
    
    thread:start()
end

function lovr.update() 
    toThread:push("Hello World")
end

function lovr.draw()
    local n = fromThread:pop()
    if n ~= nil then lovr.graphics.print('Messages Sent: ' .. n, 0, 2, -8) end
end