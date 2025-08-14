function lovr.load()
  boxMatrix = lovr.math.newMat4()
  boxMatrix:translate(0, 1, -1)
  boxMatrix:scale(.25)

  -- offset matrix represents transform from hand -> box
  offset = lovr.math.newMat4()
end

function lovr.update(dt)
  for i, hand in ipairs(lovr.headset.getHands()) do
    if lovr.headset.wasPressed(hand, 'trigger') then
      offset:set(lovr.headset.getPose(hand)):invert():mul(boxMatrix)
    end

    if lovr.headset.isDown(hand, 'trigger') then
      boxMatrix:set(lovr.headset.getPose(hand)):mul(offset)
    end
  end
end

function lovr.draw(pass)
  pass:box(boxMatrix, 'line')

  for i, hand in ipairs(lovr.headset.getHands()) do
    pass:sphere(vector(lovr.headset.getPosition(hand)), .01)
  end
end
