return {
  summary = 'Create a new WeldJoint.',
  description = 'Creates a new WeldJoint.',
  arguments = {
    colliderA = {
      type = 'Collider',
      description = [[
        The first collider to attach the Joint to, or `nil` to attach the joint to a fixed position
        in the World.
      ]]
    },
    colliderB = {
      type = 'Collider',
      description = 'The second collider to attach the Joint to.'
    }
  },
  returns = {
    joint = {
      type = 'WeldJoint',
      description = 'The new WeldJoint.'
    }
  },
  variants = {
    {
      arguments = { 'colliderA', 'colliderB' },
      returns = { 'joint' }
    }
  },
  notes = [[
    The joint will try to keep the Colliders in the relative pose they were at when the joint was
    created.
  ]],
  related = {
    'lovr.physics.newBallJoint',
    'lovr.physics.newConeJoint',
    'lovr.physics.newDistanceJoint',
    'lovr.physics.newHingeJoint',
    'lovr.physics.newSliderJoint'
  }
}
