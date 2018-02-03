return {
  tag = 'graphicsState',
  summary = 'Set the background color.',
  description = [[
    Sets the background color used to clear the screen.  Color components are from 0.0 to 1.0.
  ]],
  arguments = {
    {
      name = 'r',
      type = 'number',
      description = 'The red component of the background color.'
    },
    {
      name = 'g',
      type = 'number',
      description = 'The green component of the background color.'
    },
    {
      name = 'b',
      type = 'number',
      description = 'The blue component of the background color.'
    },
    {
      name = 'a',
      type = 'number',
      default = '1.0',
      description = 'The alpha component of the background color.'
    }
  },
  returns = {},
  notes = 'The default background color is black.'
}
