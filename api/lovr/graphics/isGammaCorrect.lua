return {
  tag = 'graphicsState',
  summary = 'Get whether wireframe mode is enabled.',
  description = [[
    Get whether or not gamma correct rendering is supported and enabled.  When enabled, lovr will
    automatically perform gamma correction on colors set via `lovr.graphics.setColor`,
    `lovr.graphics.setBackgroundColor`, `Material:setColor`, and textures created without the linear
    flag set.  Gamma correction will subtly improve lighting quality, especially in darker regions.
  ]],
  arguments = {},
  returns = {
    {
      name = 'isGammaCorrect',
      type = 'boolean',
      description = 'Whether or not gamma correction is applied to colors.'
    }
  },
  notes = 'Gamma correction must first be enabled in `lovr.conf`.',
  related = {
    'lovr.conf',
    'lovr.math.gammaToLinear',
    'lovr.math.linearToGamma'
  }
}
