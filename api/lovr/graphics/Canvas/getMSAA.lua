return {
  summary = 'Get the number of MSAA samples used by the Canvas.',
  description = [[
    Returns the number of multisample antialiasing samples to use when rendering to the Canvas.
    Increasing this number will make the contents of the Canvas appear more smooth at the cost of
    performance.  It is common to use powers of 2 for this value.
  ]],
  arguments = {},
  returns = {
    {
      name = 'samples',
      type = 'number',
      description = 'The number of MSAA samples.'
    }
  },
  notes = 'This can only be set when the Canvas is created with `lovr.graphics.newCanvas`.'
}
