return {
  tag = 'callbacks',
  summary = 'Called when a Controller button is released.',
  description = 'This callback is called when a button on a Controller is released.',
  arguments = {
    {
      name = 'controller',
      type = 'Controller',
      description = 'The new controller object.'
    },
    {
      name = 'button',
      type = 'ControllerButton',
      description = 'The button that was released.'
    }
  },
  returns = {},
  related = {
    'lovr.controllerpressed',
    'Controller:isDown',
    'ControllerButton'
  }
}
