return {
  tag = 'headset',
  summary = 'Get the type of connected headset.',
  description = [[
    Get the type of headset.  Currently only the HTC Vive is supported, though support for the
    Oculus Rift and other devices is planned.
  ]],
  arguments = {},
  returns = {
    {
      name = 'type',
      type = 'string',
      description = 'The type of the headset as a string, e.g. "Vive" for the HTC Vive.'
    }
  }
}
