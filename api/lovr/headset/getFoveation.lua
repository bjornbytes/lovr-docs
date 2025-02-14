return {
  tag = 'headset',
  summary = 'Get the current foveation settings.',
  description = [[
    Returns the current foveation settings, previously set by `lovr.headset.setFoveation`.'
  ]],
  arguments = {},
  returns = {
    level = {
      type = 'FoveationLevel',
      description = 'The foveation level (or the maximum level when dynamic foveation is active).'
    },
    dynamic = {
      type = 'boolean',
      description = [[
        Whether dynamic foveation is active, allowing the system to reduce foveation based on GPU
        load.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'level', 'dynamic' }
    }
  },
  notes = 'Foveation is disabled by default.'
}
