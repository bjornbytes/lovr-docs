return {
  tag = 'texture-transfer',
  summary = 'Clear the Texture to a color.',
  description = [[
    Clears layers and mipmaps in a texture to a given color.

    When a Texture is being used as a canvas for a `Pass`, the clear color can be set with
    `Pass:setClear`, which a more efficient way to clear the texture before rendering.
  ]],
  arguments = {
    hex = {
      type = 'number',
      description = 'The hexcode color to clear to.'
    },
    r = {
      type = 'number',
      description = 'The red component of the clear color.'
    },
    g = {
      type = 'number',
      description = 'The green component of the clear color.'
    },
    b = {
      type = 'number',
      description = 'The blue component of the clear color.'
    },
    a = {
      type = 'number',
      description = 'The alpha component of the clear color.'
    },
    t = {
      type = '{number}',
      description = 'A table with color components.'
    },
    v = {
      type = 'vector',
      description = 'A vector with the clear color (alpha will be 1).'
    },
    layer = {
      type = 'number?',
      default = '1',
      description = 'The index of the first layer to clear.'
    },
    layerCount = {
      type = 'number?',
      description = 'The number of layers to clear.  By default, clears the rest of the layers.'
    },
    mipmap = {
      type = 'number?',
      default = '1',
      description = 'The index of the first mipmap to clear.'
    },
    mipmapCount = {
      type = 'number?',
      description = 'The number of mipmaps to clear.  By default, clears the rest of the mipmaps.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Clear the whole texture to zero (transparent black).',
      arguments = {},
      returns = {}
    },
    {
      arguments = { 'hex', 'layer', 'layerCount', 'mipmap', 'mipmapCount' },
      returns = {}
    },
    {
      arguments = { 'r', 'g', 'b', 'a', 'layer', 'layerCount', 'mipmap', 'mipmapCount' },
      returns = {}
    },
    {
      arguments = { 't', 'layer', 'layerCount', 'mipmap', 'mipmapCount' },
      returns = {}
    },
    {
      arguments = { 'v', 'layer', 'layerCount', 'mipmap', 'mipmapCount' },
      returns = {}
    }
  },
  notes = [[
    The texture must have been created with the `transfer` usage to clear it.

    The clear color will be interpreted as a linear color for sRGB formats.

    When clearing a 3D texture, the `layer` and `layerCount` arguments are ignored, and all of the
    layers in a mipmap level will be cleared.
  ]],
  related = {
    'Buffer:clear',
    'Texture:setPixels',
    'Pass:setClear'
  }
}
