-- openxr accessibility interactions for 3dof (phones e.g.): 
--
--   * mousescroll to move forward/backward (in 3dof headset direction)
--   * bluetooth keyboard/mousebutton as action
--
local random = lovr.math.random
local boxes = {}
local selectedBox = nil
local clickedBox = nil
local hitpoint = nil
local red =   { 1, .5, .7 }
local green = { .5, 1, .5 }
local white = { 1, 1, 1}
local blue = { 0.5, 0, 1}
local device = 'head'
local pointer = { released = false, hover = false, scroll = false }
local motion = {
  pose = lovr.math.newMat4(),
  flying = true,
  walkingSpeed = 2,
}
local reticle = {
  scaleTo   = 0.1,
  scale     = 0.1,
  zoomSpeed = 0.35, 
  texture   = false,
  textures  = {
    idle  = lovr.graphics.newTexture("reticle_idle.png"),
    hover = lovr.graphics.newTexture("reticle_hover.png")
  }
}

function lovr.load()
  lovr.graphics.setBackgroundColor(.2, .2, .22)
  world = lovr.physics.newWorld(0, 0, 0)

  -- Make a bunch of random spinning boxes XD
  for x = -3, 3 do
    for z = 1, 10 do
      local y = .5 + lovr.math.randomNormal(.1)
      local box = world:newBoxCollider(x, y, -z, .28)
      box:setOrientation(random(2 * math.pi), random(), random(), random())
      box:setAngularVelocity(random(), random(), random())
      table.insert(boxes, box)
    end
  end
end

function lovr.update(dt)
  selectedBox = nil

  world:update(dt)

  local origin = vector(lovr.headset.getPosition(device))
  local direction = vector(lovr.headset.getDirection(device))
  local collider, shape, x, y, z = world:raycast(origin, origin + direction * 50)

  if collider then
    selectedBox = collider
    hitpoint = vector(x, y, z)
    pointer.hover = true
    if pointer.released then clickedBox = collider end
  else
    pointer.hover = false
  end

  if pointer.hover then 
    reticle.texture = reticle.textures.hover 
    if reticle.scale == reticle.scaleTo then 
      reticle.scale   = 0.05
    end
  else
    reticle.texture = reticle.textures.idle 
    reticle.scale   = reticle.scaleTo 
  end

  if pointer.scroll then moveOnScroll(direction) end

  -- animate
  if reticle.scale < reticle.scaleTo then -- animate hover
    reticle.scale = reticle.scale + (reticle.zoomSpeed * dt )
  end

  pointer = { released = false, hover = false, scroll = false } -- reset events
end

function lovr.draw(pass)
  pass:setClear(0.8, 0.8, 0.8 )
  pass:transform(mat4(motion.pose):invert()) -- move camera (scrollwheel)

  -- Boxes
  for i, box in ipairs(boxes) do
    local col = red
    if box == selectedBox then col = green end
    if box == clickedBox  then col = blue end
    pass:setColor(col)
    pass:cube(vector(box:getPosition()), .28, box:getOrientation())
  end

  -- Dot
  if selectedBox then
    pass:setColor(white)
    pass:sphere(hitpoint, .01)
  end

  -- animate & draw reticle overlay
  local pos    = vector( lovr.headset.getPosition(device) ) + vector( motion.pose:getPosition() )
  local dirx, diry, dirz = lovr.headset.getDirection(device)
  local distance = 1
  local x = pos.x + distance * dirx
  local y = pos.y + distance * diry
  local z = pos.z + distance * dirz
  local angle, ax, ay, az = lovr.headset.getOrientation(device)
  pass:setColor(white)
  pass:setCullMode('back')
  pass:draw(reticle.texture, x, y, z, reticle.scale, angle, ax, ay, az)
end

-- openxr accessibility interactions: scroll to move + key/mousebutton as action
function lovr.mousereleased(x, y, button)
  pointer.released = {x=x, y=y, button=button, type = "mouse"}
end

function lovr.keyreleased(key, scancode, isRepeat)
  pointer.released = {key=key,scancode=scancode,isRepeat=isRepeat, type = "keyboard"}
end

function lovr.wheelmoved(x, y)
  pointer.scroll   = {x=x, y=y}
end

function moveOnScroll(direction)
  if not motion.flying then direction = vector(direction.x, 0, direction.z) end
  direction = direction:normalize() -- constant speed
  -- move forward/backward via scrollwheel
  motion.pose:translate(direction * (pointer.scroll.y * motion.walkingSpeed) )
end

