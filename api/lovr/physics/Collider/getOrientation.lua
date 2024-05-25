return {
  summary = 'Get the orientation of the Collider.',
  description = 'Returns the orientation of the Collider in angle/axis representation.',
  arguments = {},
  returns = {
    angle = {
      type = 'number',
      description = 'The number of radians the Collider is rotated around its axis of rotation.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'angle', 'ax', 'ay', 'az' }
    }
  },
  notes = [[
    When the World is using a fixed timestep, this returns an interpolated orientation between the
    last two physics updates.  Use `Collider:getRawOrientation` to get the raw orientation without
    any smoothing applied.  Alternatively, set the `tickRate` to 0 when creating the world to
    disable fixed timestep and all collider interpolation.
  ]],
  related = {
    'Collider:applyTorque',
    'Collider:getRawOrientation',
    'Collider:getAngularVelocity',
    'Collider:setAngularVelocity',
    'Collider:getPosition',
    'Collider:setPosition',
    'Collider:getPose',
    'Collider:setPose'
  }
}
