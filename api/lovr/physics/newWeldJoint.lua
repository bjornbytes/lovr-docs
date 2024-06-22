return {
  tag = 'joints',
  summary = 'Create a new WeldJoint.',
  description = 'Creates a new WeldJoint.',
  arguments = {
    colliderA = {
      type = 'Collider',
      description = 'The first collider to attach the Joint to.'
    },
    colliderB = {
      type = 'Collider',
      description = 'The second collider to attach the Joint to.'
    },
    x = {
      type = 'number',
      description = 'The x position of the anchor point, in world coordinates.'
    },
    y = {
      type = 'number',
      description = 'The y position of the anchor point, in world coordinates.'
    },
    z = {
      type = 'number',
      description = 'The z position of the anchor point, in world coordinates.'
    },
    anchor = {
      type = 'Vec3',
      description = 'The anchor point, in world coordinates.'
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
      arguments = { 'colliderA', 'colliderB', 'x', 'y', 'z' },
      returns = { 'joint' }
    },
    {
      arguments = { 'colliderA', 'colliderB', 'anchor' },
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
