return {
  tag = 'headset',
  summary = 'Get the pose of the headset.',
  description = 'Returns the current position and orientation of the headset.',
  arguments = {
    eye = {
      type = 'HeadsetEye',
      description = 'The eye to get the pose of.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x position.'
    },
    y = {
      type = 'number',
      description = 'The y position.'
    },
    z = {
      type = 'number',
      description = 'The z position.'
    },
    angle = {
      type = 'number',
      description = 'The amount of rotation around the axis of rotation, in radians.'
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
    },
    {
      description = 'Get the pose of an eye.',
      arguments = { 'eye' },
      returns = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' }
    }
  },
  notes = 'Units are in meters.',
  related = {
    'lovr.headset.getPosition',
    'lovr.headset.getOrientation',
  }
}
