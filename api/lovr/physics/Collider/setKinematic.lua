return {
  summary = 'Set whether the Collider is kinematic.',
  description = [[
    Sets whether the Collider is kinematic.',

    Kinematic colliders behave like they have infinite mass.  They ignore forces applied to them
    from gravity, joints, and collisions, but they can still move if given a velocity.  Kinematic
    colliders don't collide with other kinematic colliders.  They're useful for static environment
    objects in a level, or for objects that have their position managed outside of the physics
    system like tracked hands.
  ]],
  arguments = {
    kinematic = {
      type = 'boolean',
      description = 'Whether the Collider should be kinematic.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'kinematic' },
      returns = {}
    }
  },
  notes = [[
    If a Collider has a `MeshShape` or a `TerrainShape`, the collider will always be kinematic and
    this function will do nothing.
  ]]
}
