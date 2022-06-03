-- left grip + right grip: grab VR space and move / stretch / rotate
-- left grip + right grip + right trigger: reset the view

local motion = {
  pose = lovr.math.newMat4(0,0,0, 1,1,1, 0, 0,1,0),
  left_anchor_vr = lovr.math.newVec3(),
  right_anchor_vr = lovr.math.newVec3(),
}

local palette = {0x0d2b45, 0x203c56, 0x544e68, 0x8d697a, 0xd08159, 0xffaa5e, 0xffd4a3, 0xffecd6}


function lovr.update(dt)
  local left_vr  = vec3(motion.pose:mul(lovr.headset.getPosition('hand/left')))
  local right_vr = vec3(motion.pose:mul(lovr.headset.getPosition('hand/right')))
  if lovr.headset.wasPressed('hand/left', 'grip') then
    motion.left_anchor_vr:set(left_vr)
  end
  if lovr.headset.wasPressed('hand/right', 'grip') then
    motion.right_anchor_vr:set(right_vr)
  end
  if lovr.headset.isDown('hand/left',  'grip') and
     lovr.headset.isDown('hand/right', 'grip') then
    local x, y, z, scale, _, _, angle, ax, ay, az = motion.pose:unpack()
    -- Scale: get the ratio of distances between anchors over current controllers distance
    local offset_scale = motion.left_anchor_vr:distance(motion.right_anchor_vr) / left_vr:distance(right_vr)
    offset_scale = 1 + (offset_scale - 1)
    scale = scale * offset_scale
    -- the change of scale must also affect the viewpoint location
    x, y, z = x * offset_scale, y * offset_scale, z * offset_scale
    -- Position: the mid-point of anchors is compared to midpoint of current controllers position
    local midpoint_anchor     = vec3(motion.left_anchor_vr):lerp(motion.right_anchor_vr, 0.5)
    local midpoint_controller = vec3(left_vr):lerp(right_vr, 0.5)
    local offset_position = vec3(midpoint_anchor):sub(midpoint_controller)
    x, y, z = x + offset_position.x, y + offset_position.y, z + offset_position.z
    motion.pose:set(x, y, z, scale, scale, scale, angle, ax, ay, az)  -- apply transition and scaling
    -- Rotation: get angle between current controllers and anchors in XZ
    local l_to_r_anchor = vec3(motion.right_anchor_vr):sub(motion.left_anchor_vr)
    local l_to_r_controller = vec3(right_vr):sub(left_vr)
    local sign = 1
    if vec3(l_to_r_controller):cross(vec3(l_to_r_anchor)):dot(vec3(0, 1, 0)) < 0 then
      sign = -1
    end
    l_to_r_anchor = l_to_r_anchor.xz:normalize()
    l_to_r_controller = l_to_r_controller.xz:normalize()
    local cos_angle = l_to_r_controller:dot(l_to_r_anchor)
    cos_angle = math.max(-1, math.min(1, cos_angle))
    local offset_rotation = math.acos(cos_angle) * sign
    motion.pose:rotate(offset_rotation, 0,1,0) -- apply rotation
    -- pose & anchor reset
    if lovr.headset.isDown('hand/right', 'trigger') then
      motion.pose:set()
      motion.left_anchor_vr:set(left_vr)
      motion.right_anchor_vr:set(right_vr)
    end
  end
end


function lovr.draw()
  lovr.graphics.setBackgroundColor(palette[1])
  lovr.graphics.transform(mat4(motion.pose):invert())
  -- Render hands
  for _, hand in ipairs(lovr.headset.getHands()) do
    -- Whenever pose of hand or head is used, need to account for VR movement
    local poseRW = mat4(lovr.headset.getPose(hand))
    local poseVR = mat4(motion.pose):mul(poseRW)
    if lovr.headset.isDown(hand, 'grip') then
      lovr.graphics.setColor(palette[6])
    else
      lovr.graphics.setColor(palette[8])
    end
    poseVR:scale(0.02)
    lovr.graphics.sphere(poseVR)
  end
  -- An example scene
  local t = lovr.timer.getTime()
  lovr.graphics.setCullingEnabled(true)
  local step = 0.5
  for x = -5, 5, step do
    for z = -5, 5, step do
      local y = 0.5 * math.sin(t * 0.2 + (x * 0.5)^2 + (z * 0.5)^2)
      lovr.graphics.setColor(palette[2 + math.floor(y * 10) % (#palette - 1)])
      lovr.graphics.sphere(x, y, z, step / 2)
    end
  end
end
