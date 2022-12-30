return {
  tag = 'transfer',
  summary = 'Generate mipmaps for a texture.',
  description = [[
    Generates mipmaps for a texture.  This can only be called on a transfer pass, which can be
    created with `lovr.graphics.getPass`.

    When rendering to textures with a render pass, it's also possible to automatically regenerate
    mipmaps after rendering by adding the `mipmaps` flag when creating the pass.
  ]],
  arguments = {
    texture = {
      type = 'Texture',
      description = 'The texture to mipmap.'
    },
    base = {
      type = 'number',
      default = '1',
      description = 'The index of the mipmap used to generate the remaining mipmaps.'
    },
    count = {
      type = 'number',
      default = 'nil',
      description = 'The number of mipmaps to generate.  If nil, generates the remaining mipmaps.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'texture', 'base', 'count' },
      returns = {}
    }
  }
}
