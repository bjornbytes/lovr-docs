return {
  tag = 'callbacks',
  summary = 'Called when an error occurs.',
  description = [[
    The "lovr.errhand" callback is run whenever an error occurs.  It receives two
    parameters. The first is a string containing the error message. The second is either
    nil, or a string containing a traceback (as returned by "debug.traceback()"); if nil,
    this means "lovr.errhand" is being called in the stack where the error occurred,
    and it can call "debug.traceback()" itself.

    "lovr.errhand" should return a handler function to run in a loop to show
    the error screen. This handler function is of the same type as the one returned by
    "lovr.run" and has the same requirements (such as pumping events). If an error occurs
    while this handler is running, the program will terminate immediately--
    "lovr.errhand" will not be given a second chance. Errors which occur inside "lovr.errhand"
    or in the handler it returns may not be cleanly reported, so be careful.

    A default error handler is supplied that renders the error message as text to the headset and
    to the window.
  ]],
  arguments = {
    {
      name = 'message',
      type = 'string',
      description = 'The error message.'
    },
    {
      name = 'traceback',
      type = 'string',
      description = 'A traceback string, or nil.'
    }
  },
  returns = {
    {
      name = 'handler',
      type = 'function',
      arguments = {},
      returns = {
        {
          name = 'result',
          type = '*'
        }
      },
      description = [[
        The error handler function.  It should return nil to continue running, "restart" to restart the
        app, or a number representing an exit status.
      ]]
    }
  },
  example = {
    description = 'The default error handler.',
    code = [[
      function lovr.errhand(message)
        local function formatTraceback(s)
          return s:gsub('\n[^\n]+$', ''):gsub('\t', ''):gsub('stack traceback', '\nStack')
        end

        message = tostring(message) .. formatTraceback(debug.traceback('', 4))
        print('Error:\n' .. message)

        if not lovr.graphics or not lovr.graphics.isInitialized() then
          return function() return 1 end
        end

        if lovr.audio then lovr.audio.stop() end

        local scale = .35
        local font = lovr.graphics.getDefaultFont()
        local wrap = .7 * font:getPixelDensity()
        local lines = font:getLines(message, wrap)
        local width = math.min(font:getWidth(message), wrap) * scale
        local height = .8 + #lines * font:getHeight() * scale
        local x = -width / 2
        local y = math.min(height / 2, 10)
        local z = -10

        lovr.graphics.setBackgroundColor(.11, .10, .14)
        font:setPixelDensity()

        local function render(pass)
          pass:setColor(.95, .95, .95)
          pass:text('Error', x, y, z, scale * 1.6, 0, 0, 0, 0, nil, 'left', 'top')
          pass:text(message, x, y - .8, z, scale, 0, 0, 0, 0, wrap, 'left', 'top')
        end

        return function()
          lovr.event.pump()

          for name, a in lovr.event.poll() do
            if name == 'quit' then return a or 1
            elseif name == 'restart' then return 'restart', lovr.restart and lovr.restart()
            elseif name == 'keypressed' and a == 'f5' then lovr.event.restart() end
          end

          if lovr.headset and lovr.headset.getDriver() ~= 'desktop' then
            lovr.headset.update()
            local pass = lovr.headset.getPass()
            if pass then
              render(pass)
              lovr.graphics.submit(pass)
              lovr.headset.submit()
            end
          end

          if lovr.system.isWindowOpen() then
            local pass = lovr.graphics.getWindowPass()
            if pass then
              render(pass)
              lovr.graphics.submit(pass)
              lovr.graphics.present()
            end
          end
        end
      end
    ]]
  },
  related = {
    'lovr.quit'
  }
}
