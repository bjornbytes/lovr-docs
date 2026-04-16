return {
  tag = 'vectors',
  deprecated = [[
    This function is deprecated.  It is no longer necessary, and calling it does nothing.
  ]],
  summary = 'Drain the temporary vector pool.',
  description = [[
    Drains the temporary vector pool, invalidating existing temporary vectors.

    This is called automatically at the end of each frame.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  }
}
