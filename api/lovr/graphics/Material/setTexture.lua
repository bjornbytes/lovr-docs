return {
  summary = 'Set a texture for the Material.',
  description = [[
    Sets a texture for a Material.  Different types of textures are supported for different
    lighting parameters.  If set to `nil`, textures default to a blank white texture.
  ]],
  arguments = {
    textureType = {
      type = 'MaterialTexture',
      default = [['diffuse']],
      description = 'The type of texture to get.'
    },
    texture = {
      type = 'Texture',
      description = 'The texture to apply, or nil to use the default.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'textureType', 'texture' },
      returns = {}
    },
    {
      arguments = { 'texture' },
      returns = {}
    }
  },
  related = {
    'MaterialTexture',
    'lovr.graphics.newTexture'
  }
}
