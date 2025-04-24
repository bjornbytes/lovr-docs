return {
  summary = 'Different ways to smooth textures.',
  description = 'Controls how `Sampler` objects smooth pixels in textures.',
  values = {
    {
      name = 'nearest',
      description = 'A pixelated appearance where the "nearest neighbor" pixel is used.'
    },
    {
      name = 'linear',
      description = 'A smooth appearance where neighboring pixels are averaged.'
    },
    {
      name = 'cubic',
      description = [[
        An even smoother appearance, but slower and typically only available on mobile GPUs. Use
        `lovr.graphics.isFormatSupported('format', 'cubic')` to check for support for a specific
        format, or `lovr.graphics.getFeatures().cubic` to see if cubic filtering is supported at
        all.

        Note that this can only be used for `min` and `mag` options in sampler.  Trying to use this
        for the `mip` filter mode will silently fall back to `linear`.
      ]]
    }
  },
  related = {
    'lovr.graphics.newSampler',
    'Sampler:getFilter',
    'Texture:setPixels'
  }
}
