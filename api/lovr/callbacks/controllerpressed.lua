return {
  tag = 'callbacks',
  summary = 'Called when a Controller button is pressed.',
  description = 'This callback is called when a button on a Controller is pressed.',
  arguments = {
    {
      name = 'controller',
      type = 'Controller',
      description = 'The new controller object.'
    },
    {
      name = 'button',
      type = 'ControllerButton',
      description = 'The button that was pressed.'
    }
  },
  returns = {},
  related = {
    'lovr.controllerreleased',
    'Controller:isDown',
    'ControllerButton'
  }
}
