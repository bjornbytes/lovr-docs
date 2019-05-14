return {
  tag = 'headset',
  summary = 'Get the VR API currently in use for a device.',
  description = [[
    Returns the `HeadsetDriver` that is currently in use, optionally for a specific device.  You can
    change the order of headset drivers using `lovr.conf` to prefer or exclude specific VR APIs.
  ]],
  arguments = {
    device = {
      type = 'Device',
      default = 'head',
      description = [[
        The device to get the active driver of.  This will be the first driver that is currently
        returning a pose for the device.
      ]]
    }
  },
  returns = {
    driver = {
      type = 'HeadsetDriver',
      description = 'The driver of the headset in use, e.g. "OpenVR".'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'driver' },
      description = 'Return the current driver for the headset display.'
    },
    {
      arguments = { 'device' },
      returns = { 'driver' },
      description = 'Return the current input driver for a device.'
    }
  }
}
