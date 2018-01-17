return {
  tag = 'controllers',
  summary = 'Get the number of currently connected controller objects.',
  description = 'Returns the number of currently connected controllers.',
  arguments = {},
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of currently connected controllers.'
    }
  },
  related = {
    'lovr.headset.getControllers'
  }
}
