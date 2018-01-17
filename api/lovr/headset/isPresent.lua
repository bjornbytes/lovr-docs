return {
  tag = 'headset',
  summary = 'Get whether or not a headset is connected.',
  description = 'Determine if a headset is present and ready to use.',
  arguments = {},
  returns = {
    {
      name = 'isPresent',
      type = 'boolean',
      description = 'Whether or not a headset is present.'
    }
  },
  related = {
    'Controller:isPresent'
  }
}
