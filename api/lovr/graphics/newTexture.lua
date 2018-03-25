return {
  tag = 'graphicsObjects',
  summary = 'Create a new Texture.',
  description = 'Creates a new Texture from an image file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the image to load.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing encoded image data used to create the Texture.'
    },
    textureData = {
      type = 'TextureData',
      description = 'The TextureData to create the Texture from.'
    },
    images = {
      type = 'table',
      description = [[
      ]]
    },
    flags = {
      type = 'table',
      default = '{}',
      description = 'Optional settings for the texture.',
      table = {
        {
          name = 'linear',
          type = 'boolean',
          default = 'false',
          description = 'Whether the texture is in linear color space instead of sRGB.'
        },
        {
          name = 'mipmaps',
          type = 'boolean',
          default = 'true',
          description = 'Whether mipmaps will be generated for the texture.'
        },
        {
          name = 'type',
          type = 'TextureType',
          default = 'nil',
          description = [[
            The type of Texture to load the images into.  If nil, the type will be `2d` for a
            single image, `array` for a table of images with numeric keys, or `cube` for a table
            of images with string keys.
          ]]
        }
      }
    }
  },
  returns = {
    texture = {
      name = 'texture',
      type = 'Texture',
      description = 'The new Texture.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'flags' },
      returns = { 'texture' }
    },
    {
      description = [[
        Create a Texture from a table of filenames, Blobs, or TextureData.  For cube textures, the
        individual faces can be specified using the string keys "right", "left", "top", "bottom",
        "back", "front".
      ]],
      arguments = { 'images', 'flags' },
      returns = { 'texture' }
    },
    {
      description = 'Create a texture from a single Blob.',
      arguments = { 'blob', 'flags' },
      returns = { 'texture' }
    },
    {
      description = 'Create a texture from a single TextureData.',
      arguments = { 'textureData', 'flags' },
      returns = { 'texture' }
    },
  },
  notes = [[
    The "linear" flag should be set to true for textures that don't contain color information, such
    as normal maps.  It is ignored if gamma correct rendering is disabled.  See
    `lovr.graphics.isGammaCorrect` for more info.
  ]]
}
