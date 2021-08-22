return {
  summary = 'Get the limits of the current GPU.',
  description = '',
  arguments = {},
  returns = {
    {
      name = 'limits',
      type = 'table',
      description = 'GPU limits.'
    }
  },
  related = {
    'lovr.graphics.getHardware',
    'lovr.graphics.getFeatures'
  }
}
