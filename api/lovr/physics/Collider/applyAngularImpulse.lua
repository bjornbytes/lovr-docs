return {
  summary = 'Apply an angular impulse to the Collider.',
  description = [[
    Applies an angular impulse to the Collider.

    An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to
    only be applied once.  Use `Collider:applyTorque` for a time-dependent push that happens over
    multiple frames.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the world-space impulse vector, in newton meter seconds.'
    },
    y = {
      type = 'number',
      description = 'The y component of the world-space impulse vector, in newton meter seconds.'
    },
    z = {
      type = 'number',
      description = 'The z component of the world-space impulse vector, in newton meter seconds.'
    },
    impulse = {
      type = 'Vec3',
      description = 'The world-space impulse vector, in newton meter seconds.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'impulse' },
      returns = {}
    }
  },
  notes = [[
    Kinematic colliders ignore forces.

    If the Collider is asleep, this will wake it up.

    Impulses are accumulated and processed during `World:update`.
  ]],
  related = {
    'Collider:applyTorque',
    'Collider:applyForce',
    'Collider:applyLinearImpulse'
  }
}
