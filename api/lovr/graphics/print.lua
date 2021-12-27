return {
  tag = 'drawing',
  summary = 'Draw text.',
  description = 'TODO',
  arguments = {
    {
      name = 'font',
      type = 'Font',
      description = 'The Font to use.'
    },
    {
      name = 'text',
      type = 'string',
      description = 'The text to render.'
    },
    {
      name = 'transform',
      type = 'transform',
      description = 'The transform of the text.'
    },
    {
      name = 'wrap',
      type = 'number',
      default = '0',
      description = [[[
        The maximum width of each line in meters (before scale is applied).  When zero, the text
        will not wrap.
      ]]
    },
    {
      name = 'halign',
      type = 'HorizontalAlign',
      default = [['center']],
      description = 'The horizontal alignment.'
    },
    {
      name = 'valign',
      type = 'VerticalAlign',
      default = [['middle']],
      description = 'The vertical alignment.'
    }
  },
  returns = {},
  notes = 'TODO'
}
