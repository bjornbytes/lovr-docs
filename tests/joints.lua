function lovr.load()
  local world = lovr.physics.newWorld()
  local a, b = world:newCollider(), world:newCollider()

  local joint = lovr.physics.newDistanceJoint(a, b)
  local anchor1 = vec3(-1, 1, 2)
  local anchor2 = vec3(1, 2, 0)
  joint:setAnchors(anchor1, anchor2)
  assert(vec3(select(1, joint:getAnchors())):equals(anchor1))
  assert(vec3(select(4, joint:getAnchors())):equals(anchor2))
end

lovr.event.quit()
