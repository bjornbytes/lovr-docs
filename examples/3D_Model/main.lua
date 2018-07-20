function lovr.load()
  model = lovr.graphics.newModel('teapot.obj')
end

function lovr.draw()
  lovr.graphics.setWireframe(true)
  model:draw(0, 1.2, -2.5, .35, lovr.timer.getTime() * .5, 0, 1, .1)
end
