return {
  tag = 'sourceEffects',
  summary = 'Set the spatialization settings for the Source.',
  description = [[
    Sets the spatialization settings for the Source.  Spatialization uses the poses of the source
    and listener to play the sound as if it is located in 3D space.  LÖVR can do 2 kinds of
    spatialization:

    - Simple panning.  When no HRTF is active, the volume of the left/right speaker channels are
      adjusted, for a simple spatialization effect.
    - Binaural spatialization.  When an HRTF has been set with `lovr.audio.setHRTF`, sources will be
      spatialized using binaural spatialization, which is higher quality than panning.

    Spatialization is a floating point number, so sources can blend between their raw audio and
    spatialized audio.  This can be useful for objects that are close to the listener.
  ]],
  arguments = {
    spatialization = {
      type = 'number',
      description = 'The amount of spatialization applied to the source, from 0 to 1.'
    },
    enable = {
      type = 'boolean?',
      description = 'Whether spatialization should be enabled.  `true` for 1, `false` for 0.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'spatialization' },
      returns = {}
    },
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  related = {
    'lovr.audio.setHRTF'
  }
}
