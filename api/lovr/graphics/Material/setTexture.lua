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
    },
    canvas = {
      type = 'Canvas',
      description = 'A Canvas.  The first Texture attached to the Canvas will be used.'
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
    },
    {
      arguments = { 'textureType', 'canvas' },
      returns = {}
    },
    {
      arguments = { 'canvas' },
      returns = {}
    }
  },
  related = {
    'MaterialTexture',
    'lovr.graphics.newTexture'
  }
}
