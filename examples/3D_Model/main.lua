function lovr.load()
  model = lovr.graphics.newModel('suzanne.obj')
  lovr.graphics.setWireframe(true)
end

function lovr.draw()
  model:draw(0, 1.7, -3, 1, lovr.timer.getTime() * .25)
end
