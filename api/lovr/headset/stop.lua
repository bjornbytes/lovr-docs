return {
  tag = 'headset-misc',
  summary = 'Stop the headset session.',
  description = [[
    Stops the headset session.  This tears down the connection to the VR runtime and hardware.
    `lovr.draw` will instead start rendering to the desktop window, as though the headset module was
    disabled.  However, certain information about the headset can still be queried, such as its
    name, supported passthrough modes, display size, etc.  A headset session can be started later
    using `lovr.headset.start`.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    The headset module behaves in the following manner when there is no headset session:

    - `lovr.headset.isActive` returns `false`.
    - `lovr.headset.getPass` returns `nil`.
    - All devices will be untracked.
  ]],
  related = {
    'lovr.headset.start',
    'lovr.headset.isActive'
  }
}
