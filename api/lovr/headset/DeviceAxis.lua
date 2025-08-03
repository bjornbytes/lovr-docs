return {
  summary = 'Different axes on an input device.',
  description = 'Axes on an input device.',
  values = {
    {
      name = 'trigger',
      description = 'A trigger (1D).'
    },
    {
      name = 'thumbstick',
      description = 'A thumbstick (2D).'
    },
    {
      name = 'thumbrest',
      description = 'A rest (1D, pressure sensitivity, also available as a `DeviceButton`).'
    },
    {
      name = 'touchpad',
      description = 'A touchpad (2D).'
    },
    {
      name = 'grip',
      description = 'A grip button or grab gesture (1D).'
    },
    {
      name = 'nib',
      description = [[
        The pressure sensitivity of the nib (tip) of a `stylus` device.  Also available on the
        `hand/left` and `hand/right` devices for the stylus nibs on touch pro controllers.
      ]]
    }
  },
  related = {
    'lovr.headset.getAxis',
    'DeviceButton'
  }
}
