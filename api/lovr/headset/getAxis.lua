return {
  tag = 'input',
  summary = 'Get the state of an analog axis on a device.',
  description = [[
    Get the current state of an analog axis on a device.  Axis values are usually between 0 and 1.
     Some axes are multidimensional, for example a 2D touchpad or thumbstick with x/y axes.  For
     multidimensional axes, this function will return multiple values, one number for each axis.
  ]],
  arguments = {
    {
      name = 'device',
      type = 'Device',
      description = 'The device.'
    },
    {
      name = 'axis',
      type = 'DeviceAxis',
      description = 'The axis.'
    }
  },
  returns = {
    {
      name = '...',
      type = 'number',
      description = [[
        The current state of the components of the axis, or `nil` if the device does not have any
        information about the axis.
      ]]
    }
  },
  related = {
    'DeviceAxis',
    'lovr.headset.isDown'
  }
}
