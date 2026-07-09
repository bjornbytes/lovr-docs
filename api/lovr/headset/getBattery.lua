return {
  tag = 'input',
  summary = 'Get the battery status of a device.',
  description = 'Returns the battery status of a device.',
  arguments = {
    device = {
      type = 'Device?',
      default = [['head']],
      description = 'The device to check.'
    }
  },
  returns = {
    level = {
      type = 'number?',
      description = 'The level of the battery, from 0 to 1.'
    },
    charging = {
      type = 'boolean?',
      description = 'Whether the battery is currently charging.'
    }
  },
  variants = {
    {
      arguments = { 'device' },
      returns = { 'level', 'charging' }
    }
  },
  notes = [[
    This function will return `nil` if the device doesn't have a battery, or if the `battery`
    feature in `lovr.headset.getFeatures` is not supported.

    This function is not currently able to measure the battery of the headset, only controllers and
    other devices.

    The battery info is intended to only be used for display purposes, not to drive logic.
  ]]
}
