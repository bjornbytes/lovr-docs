return {
  summary = 'Different blend operations.',
  description = [[
    Different blend operations used by `Pass:setBlendState` to control how the source and
    destination factors are combined.
  ]],
  values = {
    {
      name = 'add',
      description = 'Adds the two factors together.'
    },
    {
      name = 'subtract',
      description = 'Subtracts the destination from the source.'
    },
    {
      name = 'reversesubtract',
      description = 'Subtracts the source from the destination.'
    },
    {
      name = 'min',
      description = 'Takes the minimum of the two factors.'
    },
    {
      name = 'max',
      description = 'Takes the maximum of the two factors.'
    }
  },
  related = {
    'BlendFactor',
    'Pass:setBlendState',
    'BlendMode',
    'BlendAlphaMode',
    'Pass:setBlendMode'
  }
}
