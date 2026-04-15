return {
  tag = 'headset-simulator',
  summary = 'Set a virtual orientation for a device.',
  description = [[
    Sets the virtual orientation of a device.  When no headset sesssion is active, getting the
    orientation of the device will return this orientation.  This is used to implement the
    keyboard/mouse headset simulator in the `lovr.simulate` callback.
  ]],
  arguments = {
    device = {
      type = 'Device',
      description = 'The device to assign the position to.'
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
    orientation = {
      type = 'quaternion',
      description = 'The orientation of the device.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'device', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'device', 'orientation' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.setPosition',
    'lovr.headset.setPose',
    'lovr.headset.setButton',
    'lovr.headset.getOrientation',
    'lovr.simulate'
  }
}
