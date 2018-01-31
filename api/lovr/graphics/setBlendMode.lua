return {
  tag = 'graphicsState',
  summary = 'Set the blend mode.',
  description = [[
    Sets the blend mode.  The blend mode controls how each pixel's color is blended with the
    previous pixel's color when drawn.
  ]],
  arguments = {
    {
      name = 'blend',
      type = 'BlendMode',
      description = 'The blend mode.'
    },
    {
      name = 'alphaBlend',
      type = 'BlendAlphaMode',
      description = 'The alpha blend mode.'
    }
  },
  returns = {},
  related = {
    'BlendMode',
    'BlendAlphaMode'
  }
}
