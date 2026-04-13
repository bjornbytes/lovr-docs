return {
  tag = 'sources',
  summary = 'Flush source changes to the audio engine.',
  description = [[
    Flushes source changes to the audio engine.  Changes to sources are not reflected right away,
    but are instead sent to the audio engine all at once in a group.  This avoids issues with
    "tearing", where a group of sources are played all at once, but the audio thread starts playing
    some of them slightly earlier than others.

    This is an internal function that is called automatically by `lovr.run` after `lovr.update`.
    It is not normally necessary to call this function manually.
  ]],
  arguments = {
    dt = {
      type = 'number',
      description = 'The delta time for the current frame.  Can be zero.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'dt' },
      returns = {}
    }
  }
}
