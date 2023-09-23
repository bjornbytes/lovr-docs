return {
  summary = 'Enable or disable key repeat.',
  description = 'Enables or disables key repeat.',
  arguments = {
    enable = {
      type = 'boolean',
      description = 'Whether key repeat should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  notes = 'Key repeat is disabled by default.',
  related = {
    'lovr.keypressed'
  }
}
