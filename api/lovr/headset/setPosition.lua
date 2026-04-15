return {
  tag = 'headset-simulator',
  summary = 'Set a virtual position for a device.',
  description = [[
    Sets the virtual position of a device.  When no headset sesssion is active, getting the position
    of the device will return this position.  This is used to implement the keyboard/mouse headset
    simulator in the `lovr.simulate` callback.
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
    position = {
      type = 'vector',
      description = 'The position of the device.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'device', 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'device', 'position' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.setOrientation',
    'lovr.headset.setPose',
    'lovr.headset.setButton',
    'lovr.headset.getPosition',
    'lovr.simulate'
  }
}
