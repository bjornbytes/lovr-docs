function lovr.load()
  lovr.graphics.setBackgroundColor(.7, .7, .7)
  lovr.headset.setMirrored(false)

  -- Create a canvas for the camera
  local w, h = lovr.graphics.getDimensions()
  cameraCanvas = lovr.graphics.newCanvas(w, h, { stereo = false })

  -- Precompute camera transform (could also be attached to a controller)
  local x, y, z = -5, 5, 5
  cameraTransform = lovr.math.newTransform()
  cameraTransform:translate(x, y, z)
  cameraTransform:rotate(lovr.math.lookAt(x, y, z, 0, 0, 0))
  cameraTransform = cameraTransform:inverse()
end

local function renderScene(isCamera)
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
    lovr.graphics.cube('fill', cameraTransform:inverse())
  end

  -- Always draw the controllers
  for i, controller in ipairs(lovr.headset.getControllers()) do
    local x, y, z, angle, ax, ay, az = controller:getPose()
    lovr.graphics.cube('fill', x, y, z, .06, angle, ax, ay, az)
  end
end

-- Renders the scene to the camera canvas using the camera transform, then renders the camera
-- canvas to the window
local function renderCamera()
  lovr.graphics.setCanvas(cameraCanvas)
  lovr.graphics.clear()
  lovr.graphics.origin()
  lovr.graphics.transform(cameraTransform)
  renderScene(true)
  lovr.graphics.setCanvas()
  lovr.graphics.setColor(1, 1, 1)
  lovr.graphics.fill(cameraCanvas)
end

function lovr.draw()
  renderScene(false)
end

-- Override the default lovr.run to render the camera after rendering to the headset
function lovr.run()
  lovr.timer.step()
  if lovr.load then lovr.load() end
  return function()
    lovr.event.pump()
    for name, a, b, c, d in lovr.event.poll() do
      if name == 'quit' and (not lovr.quit or not lovr.quit()) then
        return a or 0
      end
      if lovr.handlers[name] then lovr.handlers[name](a, b, c, d) end
    end
    local dt = lovr.timer.step()
    if lovr.headset then
      lovr.headset.update(dt)
    end
    if lovr.audio then
      lovr.audio.update()
      if lovr.headset then
        lovr.audio.setOrientation(lovr.headset.getOrientation())
        lovr.audio.setPosition(lovr.headset.getPosition())
        lovr.audio.setVelocity(lovr.headset.getVelocity())
      end
    end
    if lovr.update then lovr.update(dt) end
    if lovr.graphics then
      lovr.graphics.origin()
      if lovr.draw then
        if lovr.headset then
          lovr.headset.renderTo(lovr.draw)
        else
          lovr.graphics.clear()
          lovr.draw()
        end

        renderCamera()
      end
      lovr.graphics.present()
    end
  end
end
