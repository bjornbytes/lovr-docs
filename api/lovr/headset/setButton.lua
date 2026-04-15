return {
  tag = 'headset-simulator',
  summary = 'Set a virtual button state for a device.',
  description = [[
    Sets the virtual button state of a device.  When no headset sesssion is active, querying the
    button state will return this value.  This is used to implement the keyboard/mouse headset
    simulator in the `lovr.simulate` callback.
  ]],
  arguments = {
    device = {
      type = 'Device',
      description = 'The device to assign the position to.'
    },
    button = {
      type = 'DeviceButton',
      description = 'The button to change.'
    },
    down = {
      type = 'boolean',
      description = 'Whether the button is pressed.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'device', 'button', 'down' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.setPosition',
    'lovr.headset.setOrientation',
    'lovr.headset.setPose',
    'lovr.headset.isDown',
    'lovr.headset.wasPressed',
    'lovr.headset.wasReleased',
    'lovr.simulate'
  }
}
