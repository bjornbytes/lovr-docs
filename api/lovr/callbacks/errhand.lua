return {
  tag = 'callbacks',
  summary = 'Called when an error occurs.',
  description = [[
    The `lovr.errhand` callback is run whenever an error occurs.  It receives a single string
    parameter containing the error message.

    The program exits after this callback returns.

    A default error handler is supplied that renders the error message as text in a loop.
  ]],
  arguments = {
    {
      name = 'message',
      type = 'string',
      description = 'The error message.'
    }
  },
  returns = {},
  example = [[
    function lovr.errhand(message)
      print('ohh NOOOO!', message)
    end
  ]],
  related = {
    'lovr.quit'
  }
}
