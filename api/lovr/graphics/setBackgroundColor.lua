return {
  tag = 'camera',
  summary = 'Set the background color.',
  description = 'TODO',
  arguments = {
    r = {
      type = 'number',
      description = 'The red component of the background color.',
    },
    g = {
      type = 'number',
      description = 'The green component of the background color.',
    },
    b = {
      type = 'number',
      description = 'The blue component of the background color.',
    },
    a = {
      default = '1.0',
      type = 'number',
      description = 'The alpha component of the background color.',
    },
    hex = {
      type = 'number',
      description = [[
        A hexcode (like `0xffffff`) to use for the background color (does not support alpha).
      ]]
    },
    color = {
      type = 'table',
      description = 'A table containing 3 or 4 color components.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'TODO',
      arguments = { 'r', 'g', 'b', 'a' },
      returns = {}
    },
    {
      description = 'TODO',
      arguments = { 'hex', 'a' },
      returns = {}
    },
    {
      description = 'TODO',
      arguments = { 'color' },
      returns = {}
    }
  },
  notes = 'TODO'
}
