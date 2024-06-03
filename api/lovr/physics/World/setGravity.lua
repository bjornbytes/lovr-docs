return {
  summary = 'Set the gravity of the World.',
  description = [[
    Sets the World's gravity.  Gravity is a constant acceleration applied to all colliders.  The
    default is `(0, -9.81, 0)` meters per second squared, causing colliders to fall downward.

    Use `Collider:setGravityScale` to change gravity strength for a single collider.
  ]],
  arguments = {
    xg = {
      type = 'number',
      description = 'The x component of the gravity force.'
    },
    yg = {
      type = 'number',
      description = 'The y component of the gravity force.'
    },
    zg = {
      type = 'number',
      description = 'The z component of the gravity force.'
    },
    gravity = {
      type = 'Vec3',
      description = 'The gravity force.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'xg', 'yg', 'zg' },
      returns = {}
    },
    {
      arguments = { 'gravity' },
      returns = {}
    }
  },
  notes = [[
    Kinematic colliders ignore gravity, since they are not moved by forces.  Colliders with higher
    mass do not fall faster.
  ]],
  related = {
    'Collider:getGravityScale',
    'Collider:setGravityScale',
    'Collider:getLinearDamping',
    'Collider:setLinearDamping'
  }
}
