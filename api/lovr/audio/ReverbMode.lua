return {
  summary = 'Different ways of simulating reverb.',
  description = [[
    This controls the method used to simulate reverb on a `Source`.

    Note that there is also `ReverbType` set in `lovr.conf`, which can be changed independently of
    the reverb mode used by a source.
  ]],
  values = {
    {
      name = 'listener',
      description = [[
        The listener will cast rays outwards to compute the reverb characteristics of the room, and
        use this to apply reverb to all sources using the `listener` reverb mode.  This is less
        expensive than per-source reverb because the reverb only needs to be simulated once, but it
        can be lower quality.
      ]]
    },
    {
      name = 'source',
      description = [[
        When a Source has this reverb mode, it will compute its own reverb independently.  This will
        give higher quality results, but it can quickly become very expensive to compute reverb for
        large numbers of sources.  Consider enabling this only for a small number of important
        sounds.
      ]]
    }
  },
  related = {
    'ReverbType',
    'Source:setReverb',
    'lovr.conf'
  }
}
