return {
  tag = 'controllers',
  summary = 'Get a list of currently connected controller objects.',
  description = 'Returns a list of currently connected controllers.',
  arguments = {},
  returns = {
    {
      name = 'controllers',
      type = 'table',
      description = 'A list of Controller objects.'
    }
  },
  related = {
    'lovr.headset.getControllerCount'
  }
}
