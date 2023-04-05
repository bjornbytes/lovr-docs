return {
  tag = 'headset',
  summary = 'Check if passthrough is active.',
  description = [[
    Returns whether passthrough is active.  When passthrough is active, the real world will be
    rendered behind any content rendered by LÖVR, using the alpha channel to blend between the two.
  ]],
  arguments = {},
  returns = {
    active = {
      type = 'boolean',
      description = 'Whether passthrough is active.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'active' }
    }
  },
  notes = [[
    This feature is currently only supported on Oculus Quest devices.
  ]],
  related = {
    'lovr.headset.setPassthroughEnabled'
  }
}
