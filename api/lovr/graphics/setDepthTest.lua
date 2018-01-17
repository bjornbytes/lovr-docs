return {
  tag = 'graphicsState',
  summary = 'Set or disable the depth test.',
  description = [[
    Sets the current depth test.  The depth test controls how overlapping objects are rendered.
  ]],
  arguments = {
    compareMode = {
      type = 'CompareMode',
      description = 'The new depth test.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set a new depth test.',
      arguments = { 'compareMode' },
      returns = {}
    },
    {
      description = 'Disable the depth test.',
      arguments = {},
      returns = {}
    }
  },
  notes = 'The default depth test is `less`.'
}
