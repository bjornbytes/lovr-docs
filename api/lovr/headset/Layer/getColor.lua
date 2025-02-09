return {
  summary = 'Get the color of the layer.',
  description = [[
    Returns the color of the layer.  This will tint the contents of its texture.  It can be used to
    fade the layer without re-rendering its texture, which is especially useful for layers created
    with the `static` option.
  ]],
  arguments = {},
  returns = {
    r = {
      type = 'number',
      description = 'The red component of the color.'
    },
    g = {
      type = 'number',
      description = 'The green component of the color.'
    },
    b = {
      type = 'number',
      description = 'The blue component of the color.'
    },
    a = {
      type = 'number',
      description = 'The alpha component of the color.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'r', 'g', 'b', 'a' }
    }
  },
  notes = [[
    The default color is white (all 1s).

    Not every headset system supports layer colors.  See the `layerColor` property of
    `lovr.headset.getFeatures` to check for support.
  ]]
}
