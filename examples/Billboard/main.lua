function lovr.load()
  eye = lovr.graphics.newMaterial(lovr.graphics.newTexture('eye.png'))
end

function lovr.draw()
  local t = lovr.timer.getTime() * .5 + math.pi
  local x = 0
  local y = 3
  local z = -5
  local width, height = 1, 1
  local angle, ax, ay, az = lovr.math.lookAt(x, y, z, lovr.headset.getPosition())
  lovr.graphics.plane(eye, x, y, z, width, height, angle, ax, ay, az)
end
