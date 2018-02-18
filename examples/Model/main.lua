function lovr.load()
  model = lovr.graphics.newModel('duck.dae', 'duck.png')
  lovr.graphics.setBackgroundColor(.2, .2, .2)
end

function lovr.draw()
  model:draw(0, 0, -3, 1, 4 + lovr.timer.getTime() * .1)
end
