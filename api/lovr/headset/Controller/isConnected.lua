return {
  summary = 'Determine if the Controller is still connected.',
  description = 'Determine if the Controller is still connected.',
  arguments = {},
  returns = {
    {
      name = 'connected',
      type = 'boolean',
      description = 'Whether or not the Controller is connected.'
    }
  },
  related = {
    'lovr.headset.getControllers',
    'lovr.controlleradded',
    'lovr.controllerremoved'
  }
}
