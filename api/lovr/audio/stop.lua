return {
  tag = 'devices',
  summary = 'Stop an audio device.',
  description = [[
    Stops the active playback or capture device.  This may fail if:

    - The device is not started
    - No device was initialized with `lovr.audio.setDevice`
  ]],
  arguments = {
    type = {
      type = 'AudioType?',
      default = [['playback']],
      description = 'The type of device to stop.'
    }
  },
  returns = {
    stopped = {
      type = 'boolean',
      description = 'Whether the device was successfully stopped.'
    },
    error = {
      type = 'string?',
      description = 'The error message, on failure.'
    }
  },
  variants = {
    {
      arguments = { 'type' },
      returns = { 'stopped', 'error' }
    }
  },
  notes = 'Switching devices with `lovr.audio.setDevice` will stop the existing one.',
  related = {
    'lovr.audio.getDevices',
    'lovr.audio.setDevice',
    'lovr.audio.start',
    'lovr.audio.isStarted'
  }
}
