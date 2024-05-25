return {
  summary = 'Get the raw orientation of the Collider, without any interpolation.',
  description = 'Returns the raw orientation of the Collider, without any interpolation applied.',
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
    To disable all interpolation, disable fixed timestep by setting the `tickRate` to 0 when
    creating the world.
  ]],
  related = {
    'Collider:getOrientation',
    'Collider:setOrientation',
    'Collider:getRawPosition',
    'Collider:getPosition'
  }
}
