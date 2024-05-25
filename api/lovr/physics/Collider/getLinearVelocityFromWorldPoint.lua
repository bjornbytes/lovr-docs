return {
  summary = 'Get the linear velocity of the Collider at a world space point.',
  description = [[
    Returns the linear velocity of a point on the Collider.  This includes the velocity of the
    center of mass plus the angular velocity at that point.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x position in world space.'
    },
    y = {
      type = 'number',
      description = 'The y position in world space.'
    },
    z = {
      type = 'number',
      description = 'The z position in world space.'
    },
    point = {
      type = 'Vec3',
      descriptio = 'The world-space point.'
    }
  },
  returns = {
    vx = {
      type = 'number',
      description = 'The x velocity of the point.'
    },
    vy = {
      type = 'number',
      description = 'The y velocity of the point.'
    },
    vz = {
      type = 'number',
      description = 'The z velocity of the point.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'vx', 'vy', 'vz' }
    },
    {
      arguments = { 'point' },
      returns = { 'vx', 'vy', 'vz' }
    }
  },
  related = {
    'Collider:getLinearVelocity',
    'Collider:getLinearVelocityFromLocalPoint'
  }
}
