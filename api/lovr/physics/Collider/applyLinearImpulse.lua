return {
  summary = 'Apply a linear impulse to the Collider.',
  description = [[
    Applies a linear impulse to the Collider.

    An impulse is a single instantaneous push.  Impulses are independent of time, and are meant to
    only be applied once.  Use `Collider:applyForce` for a time-dependent push that happens over
    multiple frames.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the world-space impulse vector, in newton seconds.'
    },
    y = {
      type = 'number',
      description = 'The y component of the world-space impulse vector, in newton seconds.'
    },
    z = {
      type = 'number',
      description = 'The z component of the world-space impulse vector, in newton seconds.'
    },
    px = {
      type = 'number',
      description = 'The x position to apply the impulse at, in world space.'
    },
    py = {
      type = 'number',
      description = 'The y position to apply the impulse at, in world space.'
    },
    pz = {
      type = 'number',
      description = 'The z position to apply the impulse at, in world space.'
    },
    impulse = {
      type = 'Vec3',
      description = 'The world-space impulse vector, in newton seconds.'
    },
    position = {
      type = 'Vec3',
      description = 'The position to apply the impulse at, in world space.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Apply an impulse at the center of mass.',
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      description = 'Apply an impulse at a custom position.',
      arguments = { 'x', 'y', 'z', 'px', 'py', 'pz' },
      returns = {}
    },
    {
      description = 'Apply an impulse at the center of mass, using vector types.',
      arguments = { 'impulse' },
      returns = {}
    },
    {
      description = 'Apply an impulse at a custom position, using vector types.',
      arguments = { 'impulse', 'position' },
      returns = {}
    }
  },
  notes = [[
    Kinematic colliders ignore forces.

    If the Collider is asleep, this will wake it up.

    Impulses are accumulated and processed during `World:update`.
  ]],
  related = {
    'Collider:applyForce',
    'Collider:applyTorque',
    'Collider:applyAngularImpulse'
  }
}
