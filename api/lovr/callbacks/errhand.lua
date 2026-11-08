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
  notes = [[
    The default error handler can be found [here](https://github.com/bjornbytes/lovr/blob/dev/etc/nogame/errhand.lua).
    It is fused to the LÖVR executable, similar to the nogame screen.

    When an error occurs and `lovr.errhand` hasn't been set yet, LÖVR will load the default error
    handle.  The `errhand` file can also be loaded manually to set up the error handler earlier,
    which can be useful to wrap it in custom code.
  ]],
  example = {
    description = 'Wrapping the default error screen with custom error handling logic.',
    code = [[
      require 'errhand' -- assigns the default error screen to lovr.errhand

      local errhand = lovr.errhand
      function lovr.errhand(message)
        -- log message to file, or do whatever else you need

        return errhand(message) -- then show the default error screen
      end
    ]],
  },
  related = {
    'lovr.quit'
  }
}
