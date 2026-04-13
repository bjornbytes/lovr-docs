return {
  tag = 'sourceEffects',
  summary = 'Get the reverb settings for the Source.',
  description = 'Returns the reverb settings for the Source.',
  arguments = {},
  returns = {
    level = {
      type = 'number',
      description = 'The reverb volume.'
    },
    mode = {
      type = 'ReverbMode',
      description = 'The reverb mode.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'level', 'mode' }
    }
  },
  notes = 'Reverb is disabled by default.',
  related = {
    'ReverbMode',
    'ReverbType'
  }
}
