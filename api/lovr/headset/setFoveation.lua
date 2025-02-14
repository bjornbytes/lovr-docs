return {
  tag = 'headset',
  summary = 'Set foveated rendering settings.',
  description = [[
    Sets foveated rendering settings.  Currently only fixed foveated rendering is supported.  This
    renders the edges of the screen at a lower resolution to improve GPU performance.  Higher
    foveation levels will save more GPU time, but make the edges of the screen more blocky.
  ]],
  arguments = {
    level = {
      type = 'FoveationLevel',
      description = 'The foveation level (or the maximum level when dynamic foveation is active).'
    },
    dynamic = {
      type = 'boolean',
      default = 'true',
      description = [[
        Whether the system is allowed to dynamically adjust the foveation level based on GPU load.
      ]]
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether foveation was enabled successfully.'
    }
  },
  variants = {
    {
      arguments = { 'level', 'dynamic' },
      returns = { 'success' }
    },
    {
      description = 'Disables foveation.',
      arguments = {},
      returns = { 'success' }
    }
  },
  notes = 'Foveation is disabled by default.'
}
