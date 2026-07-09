return {
  tag = 'sourceEffects',
  summary = 'Set the absorption coefficients of the Source.',
  description = [[
    Sets the absorption coefficients of the Source.  Absorption allows for simulating the decay of
    audio as it moves through a medium, with different frequencies decaying at different rates. For
    example, in air, distant sounds usually sound more muffled because higher frequencies decay
    faster than lower frequencies.
  ]],
  arguments = {
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
    },
    enable = {
      type = 'boolean?',
      description = [[
        Whether absorption should be enabled.  Falsy values will set the coefficients to zero,
        `true` will use the absorption coefficients of air (see notes).
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'low', 'mid', 'high' },
      returns = {}
    },
    {
      arguments = { 'enable' },
      returns = {}
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
