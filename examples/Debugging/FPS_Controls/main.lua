lovr.mouse = require 'lovr-mouse'

function lovr.load()
  lovr.mouse.setRelativeMode(true)

  camera = {
    transform = lovr.math.newMat4(),
    position = lovr.math.newVec3(),
    movespeed = 10,
    pitch = 0,
    yaw = 0
  }
end

function lovr.update(dt)
  local velocity = vec4()

  if lovr.system.isKeyDown('w', 'up') then
    velocity.z = -1
  elseif lovr.system.isKeyDown('s', 'down') then
    velocity.z = 1
  end

  if lovr.system.isKeyDown('a', 'left') then
    velocity.x = -1
  elseif lovr.system.isKeyDown('d', 'right') then
    velocity.x = 1
  end

  if #velocity > 0 then
    velocity:normalize()
    velocity:mul(camera.movespeed * dt)
    camera.position:add(camera.transform:mul(velocity).xyz)
  end

  camera.transform:identity()
  camera.transform:translate(0, 1.7, 0)
  camera.transform:translate(camera.position)
  camera.transform:rotate(camera.yaw, 0, 1, 0)
  camera.transform:rotate(camera.pitch, 1, 0, 0)
end

function lovr.draw(pass)
  pass:push()
  pass:transform(mat4(camera.transform):invert())
  pass:setColor(0xff0000)
  pass:cube(0, 1.7, -3, .5, lovr.timer.getTime())
  pass:setColor(0xffffff)
  pass:plane(0, 0, 0, 10, 10, math.pi / 2, 1, 0, 0)
  pass:pop()
end

function lovr.mousemoved(x, y, dx, dy)
  camera.pitch = camera.pitch - dy * .004
  camera.yaw = camera.yaw - dx * .004
end

function lovr.keypressed(key)
  if key == 'escape' then
    lovr.event.quit()
  end
end
