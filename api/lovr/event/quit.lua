return {
  summary = 'Quit the application.',
  description = [[
    Pushes an event to quit the game.  An optional number can be passed to set the exit code for the
    application.  An exit code of zero indicates normal termination, whereas a nonzero exit code
    indicates that an error occurred.
  ]],
  arguments = {
    {
      name = 'code',
      type = 'number',
      default = '0',
      description = 'The exit code of the program.'
    }
  },
  returns = {},
  notes = [[
    This function is equivalent to:

        lovr.event.push('quit', code)

    The program won't actually exit until the next time `lovr.event.poll` is called.
  ]],
  related = {
    'lovr.quit',
    'lovr.event.poll'
  }
}
