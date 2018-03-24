return {
  tag = 'callbacks',
  summary = 'Called when the headset is put on or taken off.',
  description = [[
    The `lovr.mount` callback is called when the headset is put on or taken off.  This hardware
    feature is sometimes called a "proximity sensor" and it not supported by all headsets.  You can
    use it to pause the app or show a message in the window if the headset isn't put on yet.
  ]],
  arguments = {
    {
      name = 'mounted',
      type = 'boolean',
      description = 'Whether the headset is mounted.'
    }
  },
  returns = {},
  related = {}
}
