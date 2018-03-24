return {
  tag = 'headset',
  summary = 'Get whether or not the headset is mounted.',
  description = 'Determine if the headset is on someone\'s head or not.',
  arguments = {},
  returns = {
    {
      name = 'mounted',
      type = 'boolean',
      description = 'Whether or not the headset is mounted.'
    }
  },
  related = {
    'lovr.mount'
  }
}
