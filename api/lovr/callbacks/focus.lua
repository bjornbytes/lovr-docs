return {
  tag = 'callbacks',
  summary = 'Called when the application gains or loses input focus.',
  description = [[
    The `lovr.focus` callback is called whenever the application acquires or loses focus (for
    example, when opening or closing the Steam dashboard).  The callback receives a single argument,
    focused, which is a boolean indicating whether or not the application is now focused.  It may
    make sense to pause the game or reduce visual fidelity when the application loses focus.
  ]],
  arguments = {
    focused = {
      type = 'boolean',
      description = 'Whether the program is now focused.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'focused' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.isFocused',
    'lovr.visible'
  }
}
