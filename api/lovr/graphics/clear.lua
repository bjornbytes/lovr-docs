return {
  tag = 'window',
  summary = 'Clear the screen.',
  description = [[
    Clears the screen, resetting the color, depth, and stencil information to default values.  This
    function is called automatically by `lovr.run` at the beginning of each frame to clear out the
    data from the previous frame.
  ]],
  arguments = {
    color = {
      type = 'boolean',
      default = 'true',
      description = 'Whether or not to clear color information on the screen.'
    },
    depth = {
      type = 'boolean',
      default = 'true',
      description = 'Whether or not to clear the depth information on the screen.'
    },
    stencil = {
      type = 'boolean',
      default = 'true',
      description = 'Whether or not to clear the stencil information on the screen.'
    },
    r = {
      type = 'number',
      description = 'The value to clear the red channel to, from 0.0 to 1.0.'
    },
    g = {
      type = 'number',
      description = 'The value to clear the green channel to, from 0.0 to 1.0.'
    },
    b = {
      type = 'number',
      description = 'The value to clear the blue channel to, from 0.0 to 1.0.'
    },
    a = {
      type = 'number',
      description = 'The value to clear the alpha channel to, from 0.0 to 1.0.'
    },
    z = {
      type = 'number',
      default = '1.0',
      description = 'The value to clear the depth buffer to.'
    },
    s = {
      type = 'number',
      default = '0',
      description = 'The integer value to clear the stencil buffer to.'
    }
  },
  returns = {},
  variants = {
    {
      description = [[
        Clears the color, depth, and stencil to their default values.  Color will be cleared to the
        current background color, depth will be cleared to 1.0, and stencil will be cleared to 0.
      ]],
      arguments = { 'color', 'depth', 'stencil' },
      returns = {}
    },
    {
      arguments = { 'r', 'g', 'b', 'a', 'z', 's' },
      returns = {}
    }
  },
  notes = [[
    The two variants of this function can be mixed and matched, meaning you can use booleans for
    some of the values and numeric values for others.
  ]],
  related = {
    'lovr.graphics.setBackgroundColor'
  }
}
