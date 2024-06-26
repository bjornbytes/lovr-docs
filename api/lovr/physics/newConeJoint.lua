return {
  tag = 'joints',
  summary = 'Create a new ConeJoint.',
  description = 'Creates a new ConeJoint.',
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
    },
    x = {
      type = 'number',
      description = 'The x position of the joint anchor point, in world space.'
    },
    y = {
      type = 'number',
      description = 'The y position of the joint anchor point, in world space.'
    },
    z = {
      type = 'number',
      description = 'The z position of the joint anchor point, in world space.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the cone axis, in world space.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the cone axis, in world space.'
    },
    az = {
      type = 'number',
      description = 'The z component of the cone axis, in world space.'
    },
    anchor = {
      type = 'Vec3',
      description = 'The joint anchor point, in world space.'
    },
    axis = {
      type = 'Vec3',
      description = 'The cone axis, in world space.'
    }
  },
  returns = {
    cone = {
      type = 'ConeJoint',
      description = 'The new ConeJoint.'
    }
  },
  variants = {
    {
      arguments = { 'colliderA', 'colliderB', 'x', 'y', 'z', 'ax', 'ay', 'az' },
      returns = { 'cone' }
    },
    {
      arguments = { 'colliderA', 'colliderB', 'anchor', 'axis' },
      returns = { 'cone' }
    }
  },
  notes = [[
    A ConeJoint is similar to a BallJoint, where the relative position between the colliders will be
    constrained to a single point.  However, the ConeJoint also limits the rotation away from the
    cone axis.  This can be useful for limb joints, ropes, etc.

    If the anchor is nil, the position of the first Collider is the anchor.  If the first Collider
    is nil, the position of the second collider is the anchor.

    If the axis is nil, it defaults to the direction between the anchor and the second Collider.
  ]],
  related = {
    'lovr.physics.newWeldJoint',
    'lovr.physics.newBallJoint',
    'lovr.physics.newDistanceJoint',
    'lovr.physics.newHingeJoint',
    'lovr.physics.newSliderJoint'
  }
}
