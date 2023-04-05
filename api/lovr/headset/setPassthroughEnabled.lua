return {
  tag = 'headset',
  summary = 'Enable or disable passthrough.',
  description = [[
    Sets whether passthrough is active.  When passthrough is active, the real world will be rendered
    behind any content rendered by LÖVR, using the alpha channel to blend between the two.
  ]],
  arguments = {
    enable = {
      type = 'boolean',
      description = 'Whether passthrough should be enabled.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether the passthrough state was set successfully.'
    }
  },
  variants = {
    {
      arguments = { 'enable' },
      returns = { 'success' }
    }
  },
  notes = [[
    This feature is currently only supported on Oculus Quest devices.
  ]],
  related = {
    'lovr.headset.isPassthroughEnabled'
  }
}
