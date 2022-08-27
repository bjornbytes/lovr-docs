function lovr.load()
  boxMatrix = lovr.math.newMat4() --inialize box
  boxMatrix:set(
    vec3(0,1,-1), --global position
    vec3(0.25,0.25,0.25), --scale
    quat(0,0,0,0) --global rotation
  )

  offset = lovr.math.newMat4() --initialize offset matrix
end

function lovr.update(dt)
  if lovr.headset.wasPressed('left','trigger') then
    offset:set(mat4(lovr.headset.getPose('left')):invert() * boxMatrix)
  end

  if lovr.headset.isDown('left','trigger') then
    boxMatrix:set(mat4(lovr.headset.getPose('left')) * (offset))
  end
end

function lovr.draw(pass)
  pass:box(boxMatrix, 'line')

  for i, hand in ipairs(lovr.headset.getHands()) do
    local x, y, z = lovr.headset.getPosition(hand)
    pass:sphere(x, y, z, .01)
  end
end
