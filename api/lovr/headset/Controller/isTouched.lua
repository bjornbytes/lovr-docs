return {
  summary = 'Check whether a button on the Controller is touched.',
  description = [[
    Returns whether or not a given button on the Controller is currently touched.  This may not mean
    the button is actually pressed since some controllers are touch-sensitive.
  ]],
  arguments = {
    {
      name = 'button',
      type = 'ControllerButton',
      description = 'The button to query.'
    }
  },
  returns = {
    {
      name = 'touched',
      type = 'boolean',
      description = 'Whether the button is touched.'
    }
  },
  related = {
    'ControllerButton',
    'Controller:isDown',
    'Controller:getAxis'
  }
}
