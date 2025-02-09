return {
  tag = 'system-window',
  summary = 'Check if the desktop window is visible.',
  description = 'Returns whether the desktop window is visible (open and not minimized).',
  arguments = {},
  returns = {
    visible = {
      type = 'boolean',
      description = 'Whether the desktop window is visible.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'visible' }
    }
  },
  related = {
    'lovr.visible',
    'lovr.headset.isVisible',
    'lovr.system.openWindow',
    'lovr.system.isWindowOpen',
    'lovr.system.isWindowFocused'
  }
}
