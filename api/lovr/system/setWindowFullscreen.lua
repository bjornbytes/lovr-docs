return {
  tag = 'system-window',
  summary = 'Enable or disable fullscreen on the desktop window.',
  description = [[
    Enables or disables fullscreen on the desktop window.

    Note that only borderless fullscreen is supported.

    To make the window fullscreen at startup, set `t.window.fullscreen` in `lovr.conf`.
  ]],
  arguments = {
    fullscreen = {
      type = 'boolean',
      description = 'Whether the desktop window should be fullscreen.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'fullscreen' },
      returns = {}
    }
  }
}
