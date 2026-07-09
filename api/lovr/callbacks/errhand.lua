return {
  tag = 'callbacks',
  summary = 'Called when an error occurs.',
  description = [[
    The `lovr.errhand` callback is run whenever an error occurs.  It receives a parameter containing
    the error message.  It should return a handler function that will run in a loop to render the
    error screen.

    This handler function is of the same type as the one returned by `lovr.run` and has the same
    requirements (such as pumping events).  If an error occurs while this handler is running, the
    program will terminate immediately -- `lovr.errhand` will not be given a second chance.  Errors
    which occur in the error handler or in the handler it returns may not be cleanly reported, so be
    careful.

    A default error handler is supplied that renders the error message as text to the headset and
    to the window.
  ]],
  arguments = {
    message = {
      type = 'string',
      description = 'The error message.'
    }
  },
  returns = {
    handler = {
      type = 'function?',
      arguments = {},
      returns = {
        {
          name = 'result',
          type = '*'
        }
      },
      description = [[
        The error handler function.  It should return nil to continue running, "restart" to restart
        the app, or a number representing an exit status.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'message' },
      returns = { 'handler' }
    }
  },
  related = {
    'lovr.quit'
  }
}
