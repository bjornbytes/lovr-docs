return {
  summary = 'Apply a force to the Collider.',
  description = 'Applies a force to the Collider.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the world-space force vector, in newtons.'
    },
    y = {
      type = 'number',
      description = 'The y component of the world-space force vector, in newtons.'
    },
    z = {
      type = 'number',
      description = 'The z component of the world-space force vector, in newtons.'
    },
    px = {
      type = 'number',
      description = 'The x position to apply the force at, in world space.'
    },
    py = {
      type = 'number',
      description = 'The y position to apply the force at, in world space.'
    },
    pz = {
      type = 'number',
      description = 'The z position to apply the force at, in world space.'
    },
    force = {
      type = 'Vec3',
      description = 'The world-space force vector, in newtons.'
    },
    position = {
      type = 'Vec3',
      description = 'The position to apply the force at, in world space.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Apply a force at the center of mass.',
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      description = 'Apply a force at a custom position.',
      arguments = { 'x', 'y', 'z', 'px', 'py', 'pz' },
      returns = {}
    },
    {
      description = 'Apply a force at the center of mass, using vector types.',
      arguments = { 'force' },
      returns = {}
    },
    {
      description = 'Apply a force at a custom position, using vector types.',
      arguments = { 'force', 'position' },
      returns = {}
    }
  },
  notes = [[
    Kinematic colliders ignore forces.

    If the Collider is asleep, this will wake it up.

    Forces are accumulated and processed during `World:update`.
  ]],
  related = {
    'Collider:applyLinearImpulse',
    'Collider:applyTorque',
    'Collider:applyAngularImpulse'
  }
}
