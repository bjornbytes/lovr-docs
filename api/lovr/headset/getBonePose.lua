return {
  tag = 'input',
  summary = 'Get the pose of a tracked bone.',
  description = [[
    Returns the current position and orientation of a bone tracked by a device.  This is mainly used
    for tracking hands.
  ]],
  arguments = {
    {
      name = 'device',
      type = 'Device',
      description = 'The device.'
    },
    {
      name = 'bone',
      type = 'DeviceBone',
      description = 'The bone.'
    }
  },
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position.'
    },
    {
      name = 'angle',
      type = 'number',
      description = 'The amount of rotation around the axis of rotation, in radians.'
    },
    {
      name = 'ax',
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  notes = 'Units are in meters.',
  related = {
    'lovr.headset.getPose'
  }
}
