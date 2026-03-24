return {
  tag = 'system-window',
  summary = 'Check if the desktop window is fullscreen.',
  description = 'Returns whether the desktop window is fullscreen.',
  arguments = {},
  returns = {
    fullscreen = {
      type = 'boolean',
      description = 'Whether the desktop window is currently fullscreen.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'fullscreen' }
    }
  }
}
