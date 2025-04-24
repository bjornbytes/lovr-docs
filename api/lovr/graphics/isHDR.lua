return {
  tag = 'graphics-global',
  summary = 'Check if the **super experimental** HDR mode is active.',
  description = [[
    Returns whether the **super experimental** HDR mode is active.

    To enable HDR, add `t.graphics.hdr` to `lovr.conf`.  When enabled, LÖVR will try to create an
    HDR10 window.  If the GPU supports it, then this function will return true and the window
    texture will be HDR:

    - Its format will be `rgb10a2` instead of `rgba8`.
    - The display will assume its colors are in the Rec.2020 color space, instead of sRGB.
    - The display will assume its colors are encoded with the PQ transfer function, instead of sRGB.

    For now, it's up to you to write PQ-encoded Rec.2020 color data from your shader when rendering
    to the window.
  ]],
  arguments = {},
  returns = {
    hdr = {
      type = 'boolean',
      description = 'Whether HDR is enabled.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'hdr' }
    }
  },
  notes = [[
    The following shader helper functions make it easier to convert between sRGB colors and HDR10:

        vec3 pqToLinear(vec3 color);
        vec3 linearToPQ(vec3 color);
        vec3 sRGBToRec2020(vec3 color);
        vec3 rec2020ToSRGB(vec3 color);
  ]]
}
