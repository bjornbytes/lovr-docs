return {
  summary = 'Get the linear velocity of a point on the Collider.',
  description = [[
    Returns the linear velocity of a point on the Collider.  This includes the velocity of the
    center of mass plus the angular velocity at that point.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x position in local space.'
    },
    y = {
      type = 'number',
      description = 'The y position in local space.'
    },
    z = {
      type = 'number',
      description = 'The z position in local space.'
    },
    point = {
      type = 'number',
      description = 'The local-space point.'
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
    'Collider:getLinearVelocityFromWorldPoint'
  }
}
