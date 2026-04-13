return {
  tag = 'sourceEffects',
  summary = 'Get the absorption coefficients of the Source.',
  description = [[
    Returns the absorption coefficients of the Source.  Absorption allows for simulating the decay
    of audio as it moves through a medium, with different frequencies decaying at different rates.
    For example, in air, distant sounds usually sound more muffled because higher frequencies decay
    faster than lower frequencies.
  ]],
  arguments = {},
  returns = {
    low = {
      type = 'number',
      description = 'The absorption coefficient for low frequencies (400 Hz).'
    },
    mid = {
      type = 'number',
      description = 'The absorption coefficient for midrange frequencies (2.5 kHz).'
    },
    high = {
      type = 'number',
      description = 'The absorption coefficient for high frequencies (15 kHz).'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'low', 'mid', 'high' }
    }
  },
  notes = [[
    When a Source is created, its absorption coefficients are all zero (no absorption).

    The formula used for the volume factor of each band is `math.exp(-absorption * distance)`.

    The absorption coefficients of air are `.0002`, `.0017`, and `.0182`.
  ]],
  related = {
    'Source:getFalloff',
    'Source:setFalloff',
    'AudioMaterial'
  }
}
