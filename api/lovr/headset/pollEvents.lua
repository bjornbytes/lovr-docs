return {
  tag = 'headset-misc',
  summary = 'Poll for headset events.',
  description = [[
    Polls for new headset events, adding them to the event queue.  This is called automatically by
    `lovr.run`.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  related = {
    'lovr.system.pollEvents',
    'lovr.headset.update',
    'lovr.run'
  }
}
