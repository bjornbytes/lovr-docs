return {
  summary = 'Get a texture for the Material.',
  description = [[
    Returns a texture for a Material.  Different types of textures are supported for different
    lighting parameters.  If unset, textures default to a blank white texture.
  ]],
  arguments = {
    {
      name = 'textureType',
      type = 'MaterialTexture',
      default = [['diffuse']],
      description = 'The type of texture to get.'
    }
  },
  returns = {
    {
      name = 'texture',
      type = 'Texture',
      description = 'The texture that is set, or nil if no texture is set.'
    }
  },
  related = {
    'MaterialTexture'
  }
}
