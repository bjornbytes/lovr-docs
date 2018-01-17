return {
  summary = 'Get the state of an axis on the Controller.',
  description = 'Get the current state of an axis on the Controller.  Axis values are from 0 to 1.',
  arguments = {
    {
      name = 'axis',
      type = 'ControllerAxis',
      description = 'The axis to query.'
    }
  },
  returns = {
    {
      name = 'value',
      type = 'number',
      description = 'The current state of the axis.'
    }
  },
  related = {
    'ControllerAxis',
    'Controller:isDown'
  }
}
