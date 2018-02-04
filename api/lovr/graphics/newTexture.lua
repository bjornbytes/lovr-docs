return {
  tag = 'graphicsObjects',
  summary = 'Create a new Texture.',
  description = 'Creates a new Texture from an image file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the image to load.'
    },
    right = {
      type = 'string',
      description = 'The filename of the image for the positive x direction.'
    },
    left = {
      type = 'string',
      description = 'The filename of the image for the negative x direction.'
    },
    top = {
      type = 'string',
      description = 'The filename of the image for the positive y direction.'
    },
    bottom = {
      type = 'string',
      description = 'The filename of the image for the negative y direction.'
    },
    back = {
      type = 'string',
      description = 'The filename of the image for the positive z direction.'
    },
    front = {
      type = 'string',
      description = 'The filename of the image for the negative z direction.'
    },
    images = {
      type = 'table',
      description = 'The table of image filenames.  Either 1 or 6 can be provided, as above.'
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
        Creates a new cubemap texture from 6 images.  It can be used as a skybox using
        `lovr.graphics.skybox`.
      ]],
      arguments = { 'right', 'left', 'top', 'bottom', 'back', 'front', 'flags' },
      returns = { 'texture' }
    },
    {
      description = 'Create a new texture from a table of images.',
      arguments = { 'images', 'flags' },
      returns = { 'texture' }
    }
  },
  notes = [[
    The "linear" flag should be set to true for textures that don't contain color information, such
    as normal maps.  It is ignored if gamma correct rendering is disabled.  See
    `lovr.graphics.isGammaCorrect` for more info.
  ]]
}
