return {
  summary = 'Get the pose of the Collider.',
  description = 'Returns the position and orientation of the Collider.',
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
    When the World is using a fixed timestep, this returns an interpolated pose between the last
    two physics updates.  Use `Collider:getRawPose` to get the raw pose without any smoothing
    applied.  Alternatively, set the `tickRate` to 0 when creating the world to disable fixed
    timestep and all collider interpolation.
  ]],
  related = {
    'Collider:getPosition',
    'Collider:getOrientation',
    'Collider:getRawPose'
  }
}
