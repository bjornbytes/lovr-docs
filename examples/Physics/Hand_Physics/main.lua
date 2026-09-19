--[[ Hand interaction with physics world: use trigger to solidify hand, grip to grab objects

To manipulate objects in world, we create box collider (palm) for each hand controller. This box
is updated to track location of controller.

The naive approach would be to set exact location and orientation of physical collider with values
from hand controller. This results in lousy and unconvincing collisions with other objects, as
physics engine doesn't know the speed of hand colliders at the moment of collision.

An improvement is to set linear and angular speed of kinematic hand colliders so that they
approach the target (actual location/orientation of hand controller). This works well for one
hand, however physics will start to glitch when you try to squeeze an object between two hands.
This is because kinematic hand controllers can never be affected by collision forces, so the
squeezed collider cannot push back against them and the collision cannot be resolved.

The approach taken here is to have hand controllers behave as normal dynamic colliders that can be
affected by other collisions. To track hand controllers, we attach this collider to a small
kinematic collider (can't be moved by collisions), which is moved in the naive way, with a joint.

This means hand colliders won't have 1:1 mapping with actual hand controllers, they will actually
'bend' under large force. Also the colliders can become stuck and buried beneath other objects.
This is frustrating to users, so in this example hand colliders can ghost through objects or
become solid, using the trigger button.

Grabbing objects is done by creating two joints between hand collider and object, to hold them
together. This enables pulling, stacking and throwing.                                      --]]

local hands = { -- palms that can push and grab objects
  colliders = {nil, nil},     -- physical objects for palms
  anchors = {nil, nil},
  touching  = {nil, nil},     -- the collider currently touched by each hand
  holding   = {nil, nil},     -- the collider attached to palm
  grabJoints = {{}, {}},
  solid     = {false, false}, -- hand can either pass through objects or be solid
} -- to be filled with as many hands as there are active controllers

local world
local boxes = {}

local function handEnter(hand, object)
  local id = hand:getUserData()
  local grabbable = object:getTag() == 'grab'
  if id and grabbable then
    hands.touching[id] = object
  end
end

local function handExit(hand, object)
  local id = hand:getUserData()
  if id and hands.touching[id] == object then
    hands.touching[id] = nil
  end
end

function lovr.load()
  world = lovr.physics.newWorld({
    allowSleep = false,
    tags = { 'grab' },
  })
  world:setGravity(0, -2, 0)
  world:setCallbacks({
    filter = function(a, b)
      return a:getUserData() or b:getUserData()
    end,
    enter = function(a, b, contact)
      handEnter(a, b)
      handEnter(b, a)
    end,
    exit = function(a, b, contact)
      handExit(a, b)
      handExit(b, a)
    end,
  })
  local floor = world:newBoxCollider(vector(0, 0, 0), vector(20, 0.1, 20))
  floor:setKinematic(true)
  table.insert(boxes, floor)
  -- create a fort of boxes
  lovr.math.setRandomSeed(0)
  for angle = 0, 2 * math.pi, 2 * math.pi / 12 do
    for height = 0.3, 1.5, 0.4 do
      local orientation = quaternion(angle, 0,1,0)
      local position = orientation * vector(0, height, -1)
      local size = vector(0.3, 0.4, 0.2)
      local box = world:newBoxCollider(position, size)
      box:setTag('grab')
      box:setOrientation(orientation)
      table.insert(boxes, box)
    end
  end
  -- make colliders for two hands
  for i = 1, 2 do
    local collider = world:newBoxCollider(vector(0,2,0), vector(0.04, 0.08, 0.08))
    collider:setContinuous(true)
    collider:setLinearDamping(0.7)
    collider:setAngularDamping(0.9)
    collider:setMass(0.5)
    collider:setUserData(i)
    hands.colliders[i] = collider

    local anchor = world:newBoxCollider(vector(0,2,0), vector.one * 0.001)
    anchor:setKinematic(true)
    anchor:setSensor(true)
    hands.anchors[i] = anchor

    lovr.physics.newWeldJoint(collider, anchor)
  end
end


function lovr.update(dt)
  world:update(dt)
  for i, hand in pairs(lovr.headset.getHands()) do
    -- update anchor's position, the weld joint will move the collider for us
    hands.anchors[i]:setPose(lovr.headset.getPose(hand))

    local colliderOrientation = quaternion(hands.colliders[i]:getOrientation())
    -- solidify when trigger touched
    hands.solid[i] = lovr.headset.isDown(hand, 'trigger')
    hands.colliders[i]:setSensor(not hands.solid[i])
    -- hold/release colliders
    if lovr.headset.isDown(hand, 'grip') and hands.touching[i] and not hands.holding[i] then
      hands.holding[i] = hands.touching[i]
      -- grab object with ball joint to drag it, and slider joint to also match the orientation
      table.insert(hands.grabJoints[i],
        lovr.physics.newBallJoint(hands.colliders[i], hands.holding[i], hands.colliders[i]:getPosition()))
      table.insert(hands.grabJoints[i],
        lovr.physics.newSliderJoint(hands.colliders[i], hands.holding[i], colliderOrientation:direction()))
    end
    if lovr.headset.wasReleased(hand, 'grip') and hands.holding[i] then
      for _, joint in ipairs(hands.grabJoints[i]) do
        joint:destroy()
      end
      hands.grabJoints[i] = {}
      hands.holding[i] = nil
    end
  end
end


function lovr.draw(pass)
  for i, collider in ipairs(hands.colliders) do
    pass:setColor(0.75, 0.56, 0.44)
    drawBoxCollider(pass, collider, not hands.solid[i])
  end
  lovr.math.setRandomSeed(0)
  for _, collider in ipairs(boxes) do
    local shade = 0.2 + 0.6 * lovr.math.random()
    pass:setColor(shade, shade, shade)
    drawBoxCollider(pass, collider)
  end
end


function drawBoxCollider(pass, collider, is_sensor)
  -- draw box
  pass:push()
  pass:transform(collider:getPose())
  pass:scale(collider:getShape():getDimensions())
  pass:box(nil, is_sensor and 'line' or 'fill')
  pass:pop()
end

-- grab with middle mouse when no headset is connected
local defaultSimulate = lovr.simulate
function lovr.simulate(dt)
  local grip = lovr.system.isMouseDown(3)
  lovr.headset.setButton('hand/left', 'grip', grip)
  defaultSimulate(dt)
end
