function lovr.load()
  eye = lovr.graphics.newMaterial( lovr.graphics.newTexture('eye.png') )
end

function lovr.draw()
  local t = lovr.timer.getTime() * .5 + math.pi
  local x = math.cos(t) * 2
  local y = 2
  local z = math.sin(t) * 2
  local angle, ax, ay, az = lovr.math.lookAt(x, y, z, lovr.headset.getPosition())
  lovr.graphics.plane(eye, x, y, z, 1, angle, ax, ay, az)
end
