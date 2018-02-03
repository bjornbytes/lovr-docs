return {
  summary = 'Get the state of a button on the Controller.',
  description = 'Returns the state of a button on the Controller.',
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
    'Controller:isTouched',
    'Controller:getAxis'
  }
}
