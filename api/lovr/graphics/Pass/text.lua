return {
  tag = 'drawing',
  summary = 'Draw text.',
  description = 'TODO',
  arguments = {
    font = {
      type = 'Font',
      description = 'The Font to use.'
    },
    text = {
      type = 'string',
      description = 'The text to render.'
    },
    colortext = {
      type = 'table',
      description = [[
        A table of strings with colors to render, in the form `{ color1, string1, color2, string2
      }`, where color is a `Color`.
      ]]
    },
    transform = {
      type = 'transform',
      description = 'The transform of the text.'
    },
    wrap = {
      type = 'number',
      default = '0',
      description = [[
        The maximum width of each line in meters (before scale is applied).  When zero, the text
        will not wrap.
      ]]
    },
    halign = {
      type = 'HorizontalAlign',
      default = [['center']],
      description = 'The horizontal alignment.'
    },
    valign = {
      type = 'VerticalAlign',
      default = [['middle']],
      description = 'The vertical alignment.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'text', 'transform', 'wrap', 'halign', 'valign' },
      returns = {}
    },
    {
      arguments = { 'font', 'text', 'transform', 'wrap', 'halign', 'valign' },
      returns = {}
    },
    {
      arguments = { 'colortext', 'transform', 'wrap', 'halign', 'valign' },
      returns = {}
    },
    {
      arguments = { 'font', 'colortext', 'transform', 'wrap', 'halign', 'valign' },
      returns = {}
    }
  },
  notes = 'TODO'
}
