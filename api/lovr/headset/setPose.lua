return {
  tag = 'headset-simulator',
  summary = 'Set a virtual pose for a device.',
  description = [[
    Sets the virtual pose of a device.  When no headset sesssion is active, getting the pose of the
    device will return this pose.  This is used to implement the keyboard/mouse headset simulator in
    the `lovr.simulate` callback.
  ]],
  arguments = {
    device = {
      type = 'Device',
      description = 'The device to assign the position to.'
    },
    x = {
      type = 'number',
      description = 'The x position of the device.'
    },
    y = {
      type = 'number',
      description = 'The y position of the device.'
    },
    z = {
      type = 'number',
      description = 'The z position of the device.'
    },
    angle = {
      type = 'number',
      description = 'The number of radians the device is rotated around its rotation axis.'
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
    },
    position = {
      type = 'vector',
      description = 'The position of the device.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The orientation of the device.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'device', 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'device', 'position', 'orientation' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.setPosition',
    'lovr.headset.setOrientation',
    'lovr.headset.setButton',
    'lovr.headset.getPose',
    'lovr.simulate'
  }
}
