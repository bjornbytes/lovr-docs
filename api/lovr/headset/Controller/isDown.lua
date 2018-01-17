return {
  summary = 'Get the state of a button on the Controller.',
  description = 'Check if a button on the Controller is currently pressed.',
  arguments = {
    {
      name = 'button',
      type = 'ControllerButton',
      description = 'The button to query.'
    }
  },
  returns = {
    {
      name = 'down',
      type = 'boolean',
      description = 'The current state of the button.'
    }
  },
  related = {
    'ControllerButton',
    'Controller:getAxis'
  }
}
