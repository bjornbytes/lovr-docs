return {
  tag = 'callbacks',
  summary = 'The main loop.',
  description = [[
    This callback contains the main loop to run everything.  The default is usually suitable, but
    sometimes it is helpful to override this callback for custom behavior.
  ]],
  arguments = {},
  returns = {},
  example = {
    description = 'The default `lovr.run`:',
    code = [[
      function lovr.run()
        if lovr.load then
          lovr.load()
        end

        while true do
          lovr.event.pump()

          for name, a, b, c, d in lovr.event.poll() do
            if name == 'quit' and (not lovr.quit or not lovr.quit()) then
              return a
            end

            lovr.handlers[name](a, b, c, d)
          end

          local dt = lovr.timer.step()
          if lovr.update then
            lovr.update(dt)
          end

          lovr.graphics.clear()
          lovr.graphics.origin()
          if lovr.draw then
            if lovr.headset and lovr.headset.isPresent() then
              lovr.headset.renderTo(lovr.draw)
            else
              lovr.draw()
            end
          end
          lovr.graphics.present()

          lovr.timer.sleep(.001)
        end
      end
    ]],
  },
  related = {
    'lovr.load',
    'lovr.quit'
  }
}
