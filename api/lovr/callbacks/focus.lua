return {
  tag = 'callbacks',
  summary = 'Called when the application gains or loses input focus.',
  description = [[
    The `lovr.focus` callback is called whenever the application acquires or loses focus (for
    example, when opening or closing the system VR menu).  The callback receives a `focused` argument,
    indicating whether or not the application is now focused.  Additionally, both the headset and
    desktop window have separate focus states, so a `display` argument indicates which display
    gained or lost input focus.  It may make sense to pause the game, reduce visual fidelity, or
    mute audio when the application loses focus.
  ]],
  arguments = {
    focused = {
      type = 'boolean',
      description = 'Whether the program is now focused.'
    },
    display = {
      type = 'DisplayType',
      description = 'Whether the headset or desktop window changed input focus.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'focused', 'display' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.isFocused',
    'lovr.visible'
  }
}
