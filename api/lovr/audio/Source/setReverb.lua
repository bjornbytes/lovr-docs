return {
  tag = 'sourceEffects',
  summary = 'Set the reverb settings for the Source.',
  description = 'Sets the reverb settings for the Source.',
  arguments = {
    level = {
      type = 'number',
      description = 'The reverb volume.'
    },
    mode = {
      type = 'ReverbMode',
      description = [[
        Whether the source should simulate its own reverb or use shared reverb properties simulated
        at the listener.
      ]]
    },
    enable = {
      type = 'boolean?',
      dsecription = [[
        Whether reverb should be enabled.  Passing `true` is short for setting a level of 1 and a
        mode of "listener", and falsy values will disable reverb.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'level', 'mode' },
      returns = {}
    },
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  notes = 'Reverb is disabled by default.',
  related = {
    'ReverbMode',
    'ReverbType'
  }
}
