return {
  summary = 'A single entity in the simultion.',
  description = [[
    Colliders are objects that represent a single rigid body in the physics simulation.  They can
    have forces applied to them and collide with other colliders.
  ]],
  constructors = {
    'World:newCollider',
    'World:newBoxCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newSphereCollider'
  }
}
