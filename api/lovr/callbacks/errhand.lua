return {
  tag = 'callbacks',
  summary = 'Called when an error occurs.',
  description = [[
    The `lovr.errhand` callback is run whenever an error occurs.  It receives a single string
    parameter containing the error message.  It should return a function to run in a loop to show
    the error screen.

    A default error handler is supplied that renders the error message as text to the headset and
    to the window.
  ]],
  arguments = {
    {
      name = 'message',
      type = 'string',
      description = 'The error message.'
    }
  },
  returns = {
    {
      name = 'handler',
      type = 'function',
      description = 'The error handler function.'
    }
  },
  example = [[
    function lovr.errhand(message)
      print('ohh NOOOO!', message)
      return function()
        lovr.graphics.print('There was an error', 0, 2, -5)
      end
    end
  ]],
  related = {
    'lovr.quit'
  }
}
