return {
  summary = 'Get the width of rendered text.',
  description = [[
    Returns the maximum width of a piece of text.  This function does not perform wrapping but does
    respect newlines in the text.
  ]],
  arguments = {
    string = {
      type = 'string',
      description = 'The text to measure.'
    },
    strings = {
      type = 'table',
      description = [[
        A table of multicolor strings to measure.  The colors aren't used for anything, this just
        exists to match `Pass:text`.
      ]]
    }
  },
  returns = {
    width = {
      type = 'number',
      description = 'The maximum width of the text.'
    }
  },
  variants = {
    {
      arguments = { 'string' },
      returns = { 'width' }
    },
    {
      arguments = { 'strings' },
      returns = { 'width' }
    }
  },
  related = {
    'Font:getAscent',
    'Font:getDescent',
    'Font:getHeight',
    'Font:getKerning',
    'Font:getLines'
  }
}
