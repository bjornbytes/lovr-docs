return {
  summary = 'Get the position of the Collider.',
  description = 'Returns the position of the Collider.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x position of the Collider, in meters.'
    },
    y = {
      type = 'number',
      description = 'The y position of the Collider, in meters.'
    },
    z = {
      type = 'number',
      description = 'The z position of the Collider, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  notes = [[
    When the World is using a fixed timestep, this returns an interpolated position between the last
    two physics updates.  Use `Collider:getRawPosition` to get the raw position without any
    smoothing applied.  Alternatively, set the `tickRate` to 0 when creating the world to disable
    fixed timestep and all collider interpolation.
  ]],
  related = {
    'Collider:applyForce',
    'Collider:getRawPosition',
    'Collider:getLinearVelocity',
    'Collider:setLinearVelocity',
    'Collider:getOrientation',
    'Collider:setOrientation',
    'Collider:getPose',
    'Collider:setPose'
  }
}
