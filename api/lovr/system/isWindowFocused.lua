return {
  tag = 'system-window',
  summary = 'Check if the desktop window is focused.',
  description = 'Returns whether the desktop window is focused.',
  arguments = {},
  returns = {
    focused = {
      type = 'boolean',
      description = 'Whether the desktop window is focused.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'focused' }
    }
  },
  related = {
    'lovr.focus',
    'lovr.headset.isFocused',
    'lovr.system.openWindow',
    'lovr.system.isWindowOpen',
    'lovr.system.isWindowVisible'
  }
}
