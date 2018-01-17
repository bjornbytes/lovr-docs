return {
  tag = 'callbacks',
  summary = 'Called when a Controller is disconnected.',
  description = [[
    This callback is called when a Controller is disconnected or turned off.
  ]],
  arguments = {
    {
      name = 'controller',
      type = 'Controller',
      description = 'The controller that was removed.'
    }
  },
  returns = {},
  related = {
    'lovr.controlleradded',
    'lovr.headset.getControllers',
    'lovr.headset.getControllerCount'
  }
}
