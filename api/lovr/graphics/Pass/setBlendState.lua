return {
  tag = 'pipeline',
  summary = 'Set the blend state.',
  description = [[
    Sets the raw blend states.  This is a lower-level alternative to `Pass:setBlendMode`.  When a
    pixel is drawn, the blend state controls how it is mixed with the color and alpha of the pixel
    underneath it.
  ]],
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the canvas texture that will use the new blend state.'
    },
    op = {
      type = 'BlendOp',
      description = 'The blend operation to use for color and alpha.'
    },
    src = {
      type = 'BlendFactor',
      description = 'The source factor to use for color and alpha.'
    },
    dst = {
      type = 'BlendFactor',
      description = 'The destination factor to use for color and alpha.'
    },
    opColor = {
      type = 'BlendOp',
      description = 'The blend operation to use for color.'
    },
    srcColor = {
      type = 'BlendFactor',
      description = 'The source factor to use for color.'
    },
    dstColor = {
      type = 'BlendFactor',
      description = 'The destination factor to use for color.'
    },
    opAlpha = {
      type = 'BlendOp',
      description = 'The blend operation to use for alpha.'
    },
    srcAlpha = {
      type = 'BlendFactor',
      description = 'The source factor to use for alpha.'
    },
    dstAlpha = {
      type = 'BlendFactor',
      description = 'The destination factor to use for alpha.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'op', 'src', 'dst' },
      returns = {}
    },
    {
      arguments = { 'opColor', 'opAlpha', 'srcColor', 'srcAlpha', 'dstColor', 'dstAlpha' },
      returns = {}
    },
    {
      description = [[
        Disables blending.  When something is drawn, its pixel colors will replace any existing
        color in the target texture.  This can work okay for opaque objects, but won't render text
        or transparency properly.
      ]],
      arguments = {},
      returns = {}
    },
    {
      description = 'Sets the blend state for a single canvas texture.',
      arguments = { 'index', 'op', 'src', 'dst' },
      returns = {}
    },
    {
      description = 'Sets the blend state for a single canvas texture.',
      arguments = { 'index', 'opColor', 'opAlpha', 'srcColor', 'srcAlpha', 'dstColor', 'dstAlpha' },
      returns = {}
    },
    {
      description = 'Disables blending for a single canvas texture.',
      arguments = { 'index' },
      returns = {}
    }
  },
  notes = [[
    [This tool](https://www.andersriggelsen.dk/glblendfunc.php) can help visualize blend states.
  ]]
}
