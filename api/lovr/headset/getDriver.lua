return {
  tag = 'headset',
  summary = 'Get the VR API currently in use.',
  description = [[
    Returns the `HeadsetDriver` that is currently powering the lovr.headset module.  You can change
    the order of headset drivers using `lovr.conf` to prefer or exclude specific VR APIs.
  ]],
  arguments = {},
  returns = {
    {
      name = 'driver',
      type = 'HeadsetDriver',
      description = 'The driver of the headset in use, e.g. "OpenVR".'
    }
  }
}
