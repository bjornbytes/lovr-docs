function lovr.load()
  do
    local r = lovr.data.newRasterizer(42)
    local f = lovr.graphics.newFont(r)
  end
  collectgarbage()
end
