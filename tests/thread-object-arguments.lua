function lovr.load()
  local thread = lovr.thread.newThread([[
    assert(type(...) == 'userdata')
  ]])
  thread:start(lovr.data.newBlob(1))
  thread:wait()
end

lovr.event.quit()
