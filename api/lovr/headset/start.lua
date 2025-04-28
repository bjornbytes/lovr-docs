return {
  tag = 'headset-misc',
  summary = 'Starts the headset session.',
  description = [[
    Starts the headset session.  This must be called after the graphics module is initialized.
    Normally it is called automatically by `boot.lua`, but this can be disabled by setting
    `t.headset.start` to false in `lovr.conf`.
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
    'lovr.headset.stop',
    'lovr.headset.isActive'
  }
}
