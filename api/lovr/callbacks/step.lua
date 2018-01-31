return {
  tag = 'callbacks',
  summary = 'The main loop.',
  description = [[
    This callback is called continuously and contains a single iteration of the main loop.  The
    default is usually suitable, but sometimes it is helpful to override this callback for custom
    behavior.
  ]],
  arguments = {},
  returns = {
    {
      name = 'exit',
      type = 'number',
      description = 'The exit code.  A nonzero exit code indicates an error.'
    }
  },
  example = {
    description = 'The default `lovr.step`:',
    code = [[
      function lovr.step()
        lovr.event.pump()
        for name, a, b, c, d in lovr.event.poll() do
          if name == 'quit' and (not lovr.quit or not lovr.quit()) then
            return a
          end
          lovr.handlers[name](a, b, c, d)
        end

        local dt = lovr.timer.step()
        if lovr.audio then
          lovr.audio.update()
          if lovr.headset and lovr.headset.isPresent() then
            lovr.audio.setOrientation(lovr.headset.getOrientation())
            lovr.audio.setPosition(lovr.headset.getPosition())
            lovr.audio.setVelocity(lovr.headset.getVelocity())
          end
        end
        if lovr.update then lovr.update(dt) end

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
    ]],
  },
  related = {
    'lovr.run',
    'lovr.load',
    'lovr.quit'
  }
}
