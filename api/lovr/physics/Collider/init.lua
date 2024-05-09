return {
  summary = 'A single object in a physics simulation.',
  description = [[
    - Colliders represent a single rigid body
    - Colliders exist in a World
    - Applying a force to a collider will move it
    - Gravity is a force the world applies to all its colliders each update
    - Colliders collide with other colliders
  ]],
  constructors = {
    'World:newCollider',
    'World:newBoxCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newSphereCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  },
  sections = {
    -- Motion (pose, velocity, gravity scale, damping, force, impulse, friction/restitution, axes, sleep, continuous, space conversions)
    -- Collision (shape, enabled?, sensor, tag)
    -- Mass (kinematic, getMass/Inertia/Center, resetMassData)
    -- Misc (:getWorld, :getJoints, :destroy, userdata, enabled?)
  }
}
