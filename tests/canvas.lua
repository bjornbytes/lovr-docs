function lovr.load()
  pass = lovr.graphics.newPass()
  assert(pass:getWidth() == 0 and pass:getHeight() == 0)
  pass:setCanvas(lovr.graphics.newTexture(1, 1))
  assert(pass:getWidth() == 1 and pass:getHeight() == 1)
  pass:setCanvas()
  assert(pass:getWidth() == 0 and pass:getHeight() == 0)
end
