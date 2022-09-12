return {
  tag = 'pipeline',
  summary = 'Set the blend mode.',
  description = 'Sets the blend mode.',
  arguments = {
    blend = {
      type = 'BlendMode',
      description = 'The blend mode.'
    },
    alphaBlend = {
      type = 'BlendAlphaMode',
      description = 'The alpha blend mode, used to control premultiplied alpha.'
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
