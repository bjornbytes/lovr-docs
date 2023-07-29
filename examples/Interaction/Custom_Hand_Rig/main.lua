-- Some notes about the models used here:
-- * They are MIT licensed, originally from here:
--   https://github.com/immersive-web/webxr-input-profiles/tree/main/packages/assets/profiles/generic-hand
-- * This particular model has all of the bones parented to a
--   single root Armature node.  Other approaches will need
--   to be used for models that are rigged differently, like if
--   the nodes are parented to each other in a hierarchy.
-- * This model was rigged for the Quest.  It works on other
--   hand tracking systems, but differences in metacarpal bones
--   might cause the wrist vertices to get scrunched up a bit.

-- Rigging Process
------------------
-- The wrist joint/node is used as a shared reference point.
-- There are 4 coordinate spaces:
-- 1) world space (normal headset coordinate space)
-- 2) grip space (relative to hand device pose)
-- 3) wrist space (relative to wrist joint from getSkeleton)
-- 4) model space (relative to the model root node)
-- The steps to compute the local pose of a node in the model:
-- * Start with the world-space joint from getSkeleton
-- * Compute its pose relative to the wrist joint (wristFromWorld)
-- * We need a pose relative to the root Armature, not relative
--   to the wrist.  To get this, apply the pose of the wrist node
--   in the model (modelFromWrist).
-- * So the final transform is (modelFromWrist * wristFromWorld)
local function animateHand(device, skeleton, model, map)
  model:resetNodeTransforms()

  if not skeleton then return end

  -- Get offset of wrist node in the model
  local modelFromWrist = mat4(model:getNodeTransform(map[2]))
  local wristFromModel = mat4(modelFromWrist):invert()

  -- Get offset of wrist joint in the world
  local x, y, z, _, angle, ax, ay, az = unpack(skeleton[2])
  local worldFromWrist = mat4(x, y, z, angle, ax, ay, az)
  local wristFromWorld = mat4(worldFromWrist):invert()

  -- Combine the two into a matrix that will transform the
  -- world-space hand joints into local node poses for the model
  local modelFromWorld = modelFromWrist * wristFromWorld

  -- Transform the nodes
  for index, node in pairs(map) do
    local x, y, z, _, angle, ax, ay, az = unpack(skeleton[index])

    local jointWorld = mat4(x, y, z, angle, ax, ay, az)
    local jointModel = modelFromWorld * jointWorld

    model:setNodeTransform(node, jointModel)
  end

  -- This offsets the root node so the wrist poses line up when the
  -- model is drawn at the hand pose.  Instead of doing this, you
  -- could just draw the model at worldFromWrist * wristFromModel
  local worldFromGrip = mat4(lovr.headset.getPose(device))
  local gripFromWorld = mat4(worldFromGrip):invert()
  model:setNodeTransform(model:getRootNode(), gripFromWorld * worldFromWrist * wristFromModel)
end

function lovr.load()
  hands = {}
  for i, hand in ipairs({ 'left', 'right' }) do
    hands[hand] = {
      model = lovr.graphics.newModel(hand .. '.glb'),
      skeleton = nil
    }
  end

  -- Maps skeleton joint index to node names in the model
  map = {
    [2] = 'wrist',
    [3] = 'thumb-metacarpal',
    [4] = 'thumb-phalanx-proximal',
    [5] = 'thumb-phalanx-distal',

    [7] = 'index-finger-metacarpal',
    [8] = 'index-finger-phalanx-proximal',
    [9] = 'index-finger-phalanx-intermediate',
    [10] = 'index-finger-phalanx-distal',

    [12] = 'middle-finger-metacarpal',
    [13] = 'middle-finger-phalanx-proximal',
    [14] = 'middle-finger-phalanx-intermediate',
    [15] = 'middle-finger-phalanx-distal',

    [17] = 'ring-finger-metacarpal',
    [18] = 'ring-finger-phalanx-proximal',
    [19] = 'ring-finger-phalanx-intermediate',
    [20] = 'ring-finger-phalanx-distal',

    [22] = 'pinky-finger-metacarpal',
    [23] = 'pinky-finger-phalanx-proximal',
    [24] = 'pinky-finger-phalanx-intermediate',
    [25] = 'pinky-finger-phalanx-distal'
  }
end

function lovr.update(dt)
  for device, hand in pairs(hands) do
    hand.skeleton = lovr.headset.getSkeleton(device)
    animateHand(device, hand.skeleton, hand.model, map)
  end
end

function lovr.draw(pass)
  lovr.graphics.setBackgroundColor(0x202224)

  if not hands.left.skeleton and not hands.right.skeleton then
    pass:text('No skelly :(', 0, 1, -1, .1)
    return
  end

  for device, hand in pairs(hands) do
    if hand.skeleton then
      -- Debug dots for joints
      pass:setColor(0x8000ff)
      pass:setDepthWrite(false)
      for i = 1, #hand.skeleton do
        local x, y, z, _, angle, ax, ay, az = unpack(hand.skeleton[i])
        pass:sphere(mat4(x, y, z, angle, ax, ay, az):scale(.003))
      end
      pass:setDepthWrite(true)

      -- Draw the (procedurally animated) wireframe hand model
      local worldFromGrip = mat4(lovr.headset.getPose(device))
      pass:setColor(0xffffff)
      pass:setWireframe(true)
      pass:draw(hand.model, worldFromGrip)
      pass:setWireframe(false)
    end
  end
end
