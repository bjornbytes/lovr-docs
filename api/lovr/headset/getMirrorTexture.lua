return {
  tag = 'headset',
  summary = 'Get the Texture containing a view of what\'s in the headset.',
  description = [[
    Returns a Texture that contains whatever is currently rendered to the headset.

    Sometimes this can be `nil` if the current headset driver doesn't have a mirror texture, which
    can happen if the driver renders directly to the display, like with the `desktop` driver.
  ]],
  arguments = {},
  returns = {
    mirror = {
      type = 'Texture',
      description = 'The mirror texture.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mirror' }
    }
  },
  related = {
    'lovr.mirror'
  }
}
