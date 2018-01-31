return {
  tag = 'callbacks',
  summary = 'The main entry point.',
  description = [[
    This callback is the main entry point for a LÖVR program.  It is responsible for calling
    `lovr.load` and `lovr.step`.
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
    description = 'The default `lovr.run`:',
    code = [[
      function lovr.run()
        if lovr.load then lovr.load() end
        while true do
          local exit = lovr.step()
          if exit then return exit end
        end
      end
    ]],
  },
  related = {
    'lovr.step',
    'lovr.load',
    'lovr.quit'
  }
}
