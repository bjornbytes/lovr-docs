return {
  tag = 'graphicsState',
  summary = 'Get the depth test mode.',
  description = [[
    Returns the current depth test.  The depth test controls how overlapping objects are rendered.
  ]],
  arguments = {},
  returns = {
    {
      name = 'compareMode',
      type = 'CompareMode',
      description = 'The current depth test.'
    }
  },
  notes = 'The default depth test is `less`.'
}
