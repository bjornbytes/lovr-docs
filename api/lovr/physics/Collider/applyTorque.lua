return {
  summary = 'Apply torque to the Collider.',
  description = 'Applies torque to the Collider.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the world-space torque vector, in newton meters.'
    },
    y = {
      type = 'number',
      description = 'The y component of the world-space torque vector, in newton meters.'
    },
    z = {
      type = 'number',
      description = 'The z component of the world-space torque vector, in newton meters.'
    },
    torque = {
      type = 'Vec3',
      description = 'The world-space torque vector, in newton meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'torque' },
      returns = {}
    }
  },
  notes = [[
    Kinematic colliders ignore forces.

    If the Collider is asleep, this will wake it up.

    Forces are accumulated and processed during `World:update`.
  ]],
  related = {
    'Collider:applyAngularImpulse',
    'Collider:applyForce',
    'Collider:applyLinearImpulse'
  }
}
