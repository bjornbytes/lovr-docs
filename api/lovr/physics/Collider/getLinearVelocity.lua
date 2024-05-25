return {
  summary = 'Get the linear velocity of the Collider.',
  description = [[
    Returns the world-space linear velocity of the center of mass of the Collider, in meters per
    second.
  ]],
  arguments = {},
  returns = {
    vx = {
      type = 'number',
      description = 'The x component of the velocity.'
    },
    vy = {
      type = 'number',
      description = 'The y component of the velocity.'
    },
    vz = {
      type = 'number',
      description = 'The z component of the velocity.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'vx', 'vy', 'vz' }
    }
  },
  related = {
    'Collider:applyForce',
    'Collider:getLinearVelocityFromLocalPoint',
    'Collider:getLinearVelocityFromWorldPoint',
    'Collider:getAngularVelocity',
    'Collider:setAngularVelocity',
    'Collider:getPosition',
    'Collider:setPosition'
  }
}
