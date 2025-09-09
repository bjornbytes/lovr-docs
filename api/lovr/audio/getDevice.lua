return {
  tag = 'devices',
  summary = 'Get the current audio device.',
  description = 'Returns information about the active playback or capture device.',
  arguments = {
    type = {
      type = 'AudioType',
      default = [['playback']],
      description = 'The type of device to query.'
    }
  },
  returns = {
    name = {
      type = 'string | nil',
      description = 'The name of the device, or `nil` if no device is set.'
    },
    id = {
      type = 'userdata | nil',
      description = 'The opaque id of the device, or `nil` if no device is set.'
    }
  },
  variants = {
    {
      arguments = { 'type' },
      returns = { 'name', 'id' }
    }
  },
  notes = [[
    If no device has been set yet, this function returns `nil`.

    The device doesn't need to be started.
  ]],
  related = {
    'lovr.audio.getDevices',
    'lovr.audio.setDevice'
  }
}
