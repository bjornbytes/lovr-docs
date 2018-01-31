return {
  tag = 'graphicsObjects',
  summary = 'Create a new Font.',
  description = [[
    Creates a new Font.  It can be used to render text with `lovr.graphics.print`.

    Currently, the only supported font format is TTF.
  ]],
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the font file.'
    },
    size = {
      type = 'number',
      default = '32',
      description = 'The size of the font, in pixels.'
    }
  },
  returns = {
    font = {
      type = 'Font',
      description = 'The new Font.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'size' },
      returns = { 'font' }
    },
    {
      description = 'Creates a new Font from the default font included with LÖVR (Cabin).',
      arguments = { 'size' },
      returns = { 'font' }
    }
  },
  notes = 'Larger font sizes will lead to sharper text at the cost of performance.'
}
