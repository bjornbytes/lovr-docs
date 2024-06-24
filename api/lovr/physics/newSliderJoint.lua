return {
  tag = 'joints',
  summary = 'Create a new SliderJoint.',
  description = 'Creates a new SliderJoint.',
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
    ax = {
      type = 'number',
      description = 'The x component of the slider axis.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the slider axis.'
    },
    az = {
      type = 'number',
      description = 'The z component of the slider axis.'
    },
    axis = {
      type = 'Vec3',
      description = 'The slider axis direction.'
    }
  },
  returns = {
    slider = {
      type = 'SliderJoint',
      description = 'The new SliderJoint.'
    }
  },
  variants = {
    {
      arguments = { 'colliderA', 'colliderB', 'ax', 'ay', 'az' },
      returns = { 'slider' }
    },
    {
      arguments = { 'colliderA', 'colliderB', 'axis' },
      returns = { 'slider' }
    }
  },
  notes = [[
    A slider joint constrains two colliders to only allow movement along the slider's axis.
  ]],
  related = {
    'lovr.physics.newBallJoint',
    'lovr.physics.newDistanceJoint',
    'lovr.physics.newHingeJoint'
  }
}
