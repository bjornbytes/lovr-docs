function lovr.load()
  lovr.graphics.setBackgroundColor(.05, .05, .05)
end

function lovr.draw(pass)
  pass:setColor(.1, .1, .12)
  pass:plane(0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0)
  pass:setColor(.2, .2, .2)
  pass:plane(0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0, 'line', 50, 50)
end
