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
      name = 'touchpad',
      description = 'A touchpad (2D).'
    },
    {
      name = 'grip',
      description = 'A grip button or grab gesture (1D).'
    },
    {
      name = 'nib',
      description = 'The pressure sensitivity of the nib (tip) of a `stylus` device.'
    }
  },
  related = {
    'lovr.headset.getAxis',
    'DeviceButton'
  }
}
