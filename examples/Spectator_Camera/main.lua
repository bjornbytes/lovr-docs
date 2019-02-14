function lovr.load()
  lovr.graphics.setBackgroundColor(.7, .7, .7)

  -- Precompute camera transform (could also be attached to a controller)
  local x, y, z = -5, 5, 5
  camera = lovr.math.mat4()
  camera:translate(x, y, z)
  camera:rotate(lovr.math.lookAt(x, y, z, 0, 0, 0))
  view = lovr.math.mat4(camera):invert()
end

local renderScene

-- Render to the mirror window using the camera perspective
function lovr.mirror()
  lovr.graphics.clear()
  lovr.graphics.origin()
  lovr.graphics.transform(view)
  renderScene(true)
end

-- Render to the headset using the headset perspective
function lovr.draw()
  renderScene(false)
end

renderScene = function(isCamera)
  local t = lovr.timer.getTime()

  -- Draw the ground
  lovr.graphics.setColor(.15, .15, .15)
  lovr.graphics.plane('fill', 0, 0, 0, 4, 4, math.pi / 2, 1, 0, 0)

  -- Draw some cubes
  lovr.graphics.setColor(1, 0, 0)
  for i = -3, 3 do
    local ax, ay, az = lovr.math.noise(i + t), lovr.math.noise(i + t * .3), lovr.math.noise(i + t * .7)
    lovr.graphics.cube('fill', i, 2 + math.sin(i + t), -1, .2, (t * .1) ^ 2 * math.pi, ax, ay, az)
  end

  -- Draw the headset or the camera, depending on the viewer
  if isCamera then
    lovr.graphics.setColor(1, 1, 1)
    local x, y, z, angle, ax, ay, az = lovr.headset.getPose()
    lovr.graphics.cube('fill', x, y, z, .2, angle, ax, ay, az)
  else
    lovr.graphics.setColor(1, 1, 1)
    lovr.graphics.cube('fill', camera)
  end

  -- Always draw the controllers
  for i, controller in ipairs(lovr.headset.getControllers()) do
    local x, y, z, angle, ax, ay, az = controller:getPose()
    lovr.graphics.cube('fill', x, y, z, .06, angle, ax, ay, az)
  end
end
