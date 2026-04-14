return {
  summary = 'Different blend factors.',
  description = [[
    Different blend factors used by `Pass:setBlendState` to control the source and destination
    factors used for blending.
  ]],
  values = {
    {
      name = 'zero',
      description = 'Zero.'
    },
    {
      name = 'one',
      description = 'One.'
    },
    {
      name = 'srccolor',
      description = 'Source color.'
    },
    {
      name = 'oneminussrccolor',
      description = 'One minus the source color.'
    },
    {
      name = 'srcalpha',
      description = 'Source alpha.'
    },
    {
      name = 'oneminussrcalpha',
      description = 'One minus the source alpha.'
    },
    {
      name = 'dstcolor',
      description = 'Destination color.'
    },
    {
      name = 'oneminusdstcolor',
      description = 'One minus the destination color.'
    },
    {
      name = 'dstalpha',
      description = 'Destination alpha.'
    },
    {
      name = 'oneminusdstalpha',
      description = 'One minus the destination alpha.'
    },
    {
      name = 'srcalphasaturated',
      description = 'min(srcalpha, oneminusdstalpha)'
    },
  },
  related = {
    'BlendOp',
    'Pass:setBlendState',
    'BlendMode',
    'BlendAlphaMode',
    'Pass:setBlendMode'
  }
}
