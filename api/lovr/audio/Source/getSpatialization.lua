return {
  tag = 'sourceEffects',
  summary = 'Get the spatialization settings for the Source.',
  description = [[
    Returns the spatialization settings for the Source.  Spatialization uses the poses of the source
    and listener to play the sound as if it is located in 3D space.  LÖVR can do 2 kinds of
    spatialization:

    - Simple panning.  When no HRTF is active, the volume of the left/right speaker channels are
      adjusted, for a simple spatialization effect.
    - Binaural spatialization.  When an HRTF has been set with `lovr.audio.setHRTF`, sources will be
      spatialized using binaural spatialization, which is higher quality than panning.

    Spatialization is a floating point number, so sources can blend between their raw audio and
    spatialized audio.  This can be useful for objects that are close to the listener.
  ]],
  arguments = {},
  returns = {
    spatialization = {
      type = 'number',
      description = 'The amount of spatialization applied to the source, from 0 to 1.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'spatialization' }
    }
  },
  notes = 'Spatialization is disabled by default.',
  related = {
    'lovr.audio.setHRTF'
  }
}
