return {
  tag = 'listener',
  summary = 'Check if audio is spatialized.',
  description = [[
    Returns whether or not audio is currently spatialized with HRTFs.  Spatialized audio is much
    more immersive.
  ]],
  arguments = {},
  returns = {
    {
      name = 'spatialized',
      type = 'boolean',
      description = 'Whether or not audio is spatialized.'
    }
  }
}
