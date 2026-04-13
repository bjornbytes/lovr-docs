return {
  summary = 'Different ways of simulating reverb.',
  description = [[
    Reverb can be modeled in two different ways.  This is a global setting set in `lovr.conf`.

    In addition to the global reverb type, there is `ReverbMode`, which controls whether reverb is
    simulated once from the listener, or from individual sources.  This can be set on a per-source
    basis using `Source:setReverb`.
  ]],
  values = {
    {
      name = 'convolution',
      description = [[
        Convolution reverb.  This sounds more realistic than parametric reverb, especially for
        outdoor spaces, but is more expensive to simulate.
      ]]
    },
    {
      name = 'parametric',
      description = 'Parametric reverb.  Cheaper than convolution reverb, but lower quality.'
    }
  },
  related = {
    'ReverbMode',
    'Source:setReverb',
    'lovr.conf'
  }
}
