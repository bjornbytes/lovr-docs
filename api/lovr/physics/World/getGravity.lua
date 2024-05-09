return {
  tag = 'worldProperties',
  summary = 'Get the gravity of the World.',
  description = [[
    Returns the World's gravity.  Gravity is a constant acceleration applied to all colliders.  The
    default is `(0, -9.81, 0)` meters per second squared, causing colliders to fall downward.

    Use `Collider:setGravityScale` to change gravity strength for a single collider.
  ]],
  arguments = {},
  returns = {
    gx = {
      type = 'number',
      description = 'The x component of the gravity force, in meters per second squared.'
    },
    gy = {
      type = 'number',
      description = 'The y component of the gravity force, in meters per second squared.'
    },
    gz = {
      type = 'number',
      description = 'The z component of the gravity force, in meters per second squared.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'gx', 'gy', 'gz' }
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
