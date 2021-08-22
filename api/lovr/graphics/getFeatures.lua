return {
  summary = 'Get the set of supported GPU features.',
  description = '',
  arguments = {},
  returns = {
    {
      name = 'features',
      type = 'table',
      description = 'GPU features.'
    }
  },
  related = {
    'lovr.graphics.getHardware',
    'lovr.graphics.getLimits'
  }
}
