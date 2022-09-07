return {
  tag = 'pipeline',
  summary = 'Set the blend mode.',
  description = 'TODO',
  arguments = {
    blend = {
      type = 'BlendMode',
      description = 'The blend mode.'
    },
    alphaBlend = {
      type = 'BlendAlphaMode',
      description = 'The alpha blend mode.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'blend', 'alphaBlend' },
      returns = {}
    }
  },
  notes = 'TODO'
}
