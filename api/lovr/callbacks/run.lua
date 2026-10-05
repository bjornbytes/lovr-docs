return {
  tag = 'callbacks',
  summary = 'The main entry point.',
  description = [[
    This callback is the main entry point for a LÖVR program.  It calls `lovr.load` and returns a
    function that will be called every frame.
  ]],
  arguments = {},
  returns = {
    loop = {
      type = 'function',
      arguments = {},
      returns = {
        {
          name = 'result',
          type = '*'
        }
      },
      description = 'The main loop function.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'loop' }
    }
  },
  notes = [[
    The main loop function can return one of the following values:

    - Returning `nil` will keep the main loop running.
    - Returning the string 'restart' plus an optional value will restart LÖVR.  The value can be
      accessed in the `restart` key of the `arg` global.
    - Returning a number will exit LÖVR using the number as the exit code (0 means success).

    Care should be taken when overriding this callback.  For example, if the main loop does not call
    `lovr.system.pollEvents` then the OS will think LÖVR is unresponsive, or if the quit event is
    not handled then closing the window won't work.
  ]],
  example = {
    description = 'The default `lovr.run`:',
    code = [[
      function lovr.run()
        if lovr.timer then lovr.timer.step() end
        if lovr.load then lovr.load(arg) end
        return function()
          if lovr.headset then lovr.headset.pollEvents() end
          if lovr.system then lovr.system.pollEvents() end
          if lovr.event then
            for name, a, b, c, d in lovr.event.poll() do
              if name == 'restart' then return 'restart', lovr.restart and lovr.restart()
              elseif name == 'quit' and (not lovr.quit or not lovr.quit(a)) then return a or 0
              elseif name ~= 'quit' and lovr.handlers[name] then lovr.handlers[name](a, b, c, d) end
            end
          end
          local dt = 0
          if lovr.headset then lovr.headset.update() end
          if lovr.timer then dt = lovr.timer.step() end
          if lovr.headset and not lovr.headset.isActive() and lovr.simulate then lovr.simulate(dt) end
          if lovr.task then
            for task in lovr.task.poll() do
              lovr.taskready(task)
            end
          end
          if lovr.update then lovr.update(dt) end
          if lovr.audio then lovr.audio.update(dt) end
          if lovr.graphics then
            local window = lovr.graphics.getWindowPass()
            if lovr.headset then
              local headset = lovr.headset.getPass()
              if headset and lovr.draw and lovr.draw(headset) then headset = nil end
              if window and lovr.mirror and lovr.mirror(window) then window = nil end
              if headset or window then lovr.graphics.submit(headset, window) end
              lovr.headset.submit()
            elseif window and (not lovr.draw or not lovr.draw(window)) then
              lovr.graphics.submit(window)
            end
            lovr.graphics.present()
          elseif lovr.headset then
            lovr.headset.submit()
          end
        end
      end
    ]],
  },
  related = {
    'lovr.load',
    'lovr.quit'
  }
}
