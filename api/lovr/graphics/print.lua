return {
  tag = 'graphicsPrimitives',
  summary = 'Render text.',
  description = 'Draws text in 3D space using the active font.',
  arguments = {
    {
      name = 'str',
      type = 'string',
      description = 'The text to render.'
    },
    {
      name = 'x',
      type = 'number',
      default = 0,
      description = 'The x coordinate of the center of the text.'
    },
    {
      name = 'y',
      type = 'number',
      default = 0,
      description = 'The y coordinate of the center of the text.'
    },
    {
      name = 'z',
      type = 'number',
      default = 0,
      description = 'The z coordinate of the center of the text.'
    },
    {
      name = 'scale',
      type = 'number',
      default = 1,
      description = 'The scale of the text.'
    },
    {
      name = 'angle',
      type = 'number',
      default = 0,
      description = 'The number of radians to rotate the text around its rotation axis.'
    },
    {
      name = 'ax',
      type = 'number',
      default = 0,
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      default = 1,
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      default = 0,
      description = 'The z component of the axis of rotation.'
    },
    {
      name = 'wrap',
      type = 'number',
      default = '0',
      description = [[
        The maximum width of each line, in meters (affected by `scale`).  Set to 0 or `nil` for no
        wrapping.
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
  notes = [[
    Unicode text is supported.

    Use `\n` to add line breaks.
  ]],
  related = {
    'lovr.graphics.getFont',
    'lovr.graphics.setFont',
    'lovr.graphics.newFont',
    'Font'
  }
}
