return {
  summary = 'Get information about the current GPU.',
  description = '',
  arguments = {},
  returns = {
    {
      name = 'hardware',
      type = 'table',
      description = 'GPU info.'
    }
  },
  related = {
    'lovr.graphics.getFeatures',
    'lovr.graphics.getLimits'
  }
}
