box = {
  position = lovr.math.newVec3(0, 1, -.25),
  size = .25
}

function lovr.load()
  drag = {
    active = false,
    hand = nil,
    offset = lovr.math.newVec3()
  }
end

function lovr.update(dt)
  for i, hand in ipairs(lovr.headset.getHands()) do
    if lovr.headset.wasPressed(hand, 'trigger') then
      local offset = box.position - vec3(lovr.headset.getPosition(hand))
      local halfSize = box.size / 2
      local x, y, z = offset:unpack()
      if math.abs(x) < halfSize and math.abs(y) < halfSize and math.abs(z) < halfSize then
        drag.active = true
        drag.hand = hand
        drag.offset:set(offset)
      end
    end
  end

  if drag.active then
    local handPosition = vec3(lovr.headset.getPosition(drag.hand))
    box.position:set(handPosition + drag.offset)

    if lovr.headset.wasReleased(drag.hand, 'trigger') then
      drag.active = false
    end
  end
end

function lovr.draw(pass)
  pass:setColor(drag.active and 0x80ee80 or 0xee8080)
  pass:cube(box.position, box.size, quat(), 'line')

  for i, hand in ipairs(lovr.headset.getHands()) do
    pass:setColor(0xffffff)
    pass:cube(mat4(lovr.headset.getPose(hand)):scale(.01))
  end
end
