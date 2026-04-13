return {
  tag = 'listener',
  summary = 'Set an HRTF to use for audio spatialization.',
  description = [[
    Sets an HRTF to use for binaural audio spatialization.  The HRTF should be provided as a SOFA
    file (Spatially Oriented File Format for Acoustics).

    Without an HRTF, LÖVR will use simple panning for spatialization, which adjusts the volume level
    of the left/right audio channels based on the source's location.  Binaural audio spatialization
    with an HRTF sounds more realistic, at a small performance cost.

    This is a slow function, so it should be called during startup or on a thread.
  ]],
  arguments = {
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing a SOFA file to load.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'file' },
      returns = {}
    },
    {
      description = 'Clears any active HRTF, disabling binaural spatialization.',
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    A default HRTF can be found [here](https://github.com/ValveSoftware/steam-audio/blob/master/core/data/hrtf/cipic_124.sofa).
  ]],
  related = {
    'Source:setSpatialization'
  }
}
