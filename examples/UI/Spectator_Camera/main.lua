function lovr.load()
  lovr.graphics.setBackground(.7, .7, .7)

  -- Precompute camera transform (could also be attached to a controller)
  local x, y, z = -3, 3, 3
  camera = lovr.math.newMat4():target(vec3(x, y, z), vec3(0, 0, 0))
  view   = lovr.math.newMat4():lookAt(vec3(x, y, z), vec3(0, 0, 0))
end

local renderScene

-- Render to the mirror window using the camera perspective
function lovr.mirror(pass)
  pass:transform(view)
  renderScene(pass, true)
end

-- Render to the headset using the headset perspective
function lovr.draw(pass)
  renderScene(pass, false)
end

renderScene = function(pass, isCamera)
  local t = lovr.headset.getTime()

  -- Draw the ground
  pass:setColor(.15, .15, .15)
  pass:plane(0, 0, 0, 4, 4, math.pi / 2, 1, 0, 0)

  -- Draw some cubes
  pass:setColor(1, 0, 0)
  for i = -3, 3 do
    local ax, ay, az = lovr.math.noise(i + t), lovr.math.noise(i + t * .3), lovr.math.noise(i + t * .7)
    pass:cube(i, 2 + math.sin(i + t), -1, .2, (t * .1) * math.pi, ax, ay, az)
  end

  -- Draw the headset or the camera, depending on the viewer
  if isCamera then
    pass:setColor(1, 1, 1)
    local x, y, z, angle, ax, ay, az = lovr.headset.getPose()
    pass:cube(x, y, z, .2, angle, ax, ay, az)
  else
    pass:setColor(1, 1, 1)
    pass:cube(camera)
  end

  -- Always draw the controllers
  for i, hand in ipairs(lovr.headset.getHands()) do
    local x, y, z, angle, ax, ay, az = lovr.headset.getPose(hand)
    pass:cube(x, y, z, .06, angle, ax, ay, az)
  end
end
