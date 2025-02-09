return {
  summary = 'Distinguishes between the headset and window displays.',
  description = [[
    This enum is used to distinguish whether a display is the headset display or the desktop window.
  ]],
  values = {
    {
      name = 'headset',
      description = 'The headset.'
    },
    {
      name = 'window',
      description = 'The desktop window.'
    }
  },
  related = {
    'lovr.focus',
    'lovr.visible'
  }
}
