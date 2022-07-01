function lovr.load()
  world = lovr.physics.newWorld()
  c1 = world:newBoxCollider(1e8, 0, 0)
  c2 = world:newBoxCollider(1e8, 0, 0)
  world:update(1)
end
