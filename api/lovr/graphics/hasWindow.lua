return {
  tag = 'window',
  summary = 'Check if the window is created.',
  description = 'Returns whether the desktop window is currently created.',
  arguments = {},
  returns = {
    {
      name = 'present',
      type = 'boolean',
      description = 'Whether a window is created.'
    }
  },
  related = {
    'lovr.graphics.createWindow',
    'lovr.conf'
  }
}
