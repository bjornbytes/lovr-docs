return {
  summary = 'Check if the Collider is kinematic.',
  description = [[
    Returns whether the Collider is kinematic.

    Kinematic colliders behave like they have infinite mass.  They ignore forces applied to them
    from gravity, joints, and collisions, but they can still move if given a velocity.  Kinematic
    colliders don't collide with other kinematic colliders.  They're useful for static environment
    objects in a level, or for objects that have their position managed outside of the physics
    system like tracked hands.
  ]],
  arguments = {},
  returns = {
    kinematic = {
      type = 'boolean',
      description = 'Whether the Collider is kinematic.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'kinematic' }
    }
  },
  notes = 'If a Collider has a `MeshShape` or a `TerrainShape`, it will always be kinematic.'
}
