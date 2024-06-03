return {
  summary = 'Get the raw pose of the Collider, without any interpolation.',
  description = [[
    Returns the position and orientation of the Collider, without any interpolation applied.
  ]],
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
    },
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
      returns = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' }
    }
  },
  notes = [[
    To disable all interpolation, disable fixed timestep by setting the `tickRate` to 0 when
    creating the world.
  ]],
  related = {
    'Collider:getRawPosition',
    'Collider:getRawOrientation',
    'Collider:getPose'
  }
}
