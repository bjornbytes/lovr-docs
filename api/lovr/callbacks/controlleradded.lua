return {
  tag = 'callbacks',
  summary = 'Called when a Controller is connected.',
  description = [[
    This callback is called when a Controller is connected, discovered, or woken up.
  ]],
  arguments = {
    {
      name = 'controller',
      type = 'Controller',
      description = 'The new controller object.'
    }
  },
  returns = {},
  related = {
    'lovr.controllerremoved',
    'lovr.headset.getControllers',
    'lovr.headset.getControllerCount'
  }
}
