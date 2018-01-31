return {
  tag = 'graphicsObjects',
  summary = 'Create a new Texture.',
  description = 'Creates a new Texture from an image file.',
  arguments = {
    filename = {
      type = 'string',
      description = 'The filename of the image to load.'
    },
    width = {
      type = 'number',
      description = 'The width of the Texture, in pixels.'
    },
    height = {
      type = 'number',
      description = 'The height of the Texture, in pixels.'
    },
    projection = {
      type = 'TextureProjection',
      description = 'The type of projection to use when rendering to the Texture.'
    },
    msaa = {
      type = 'number',
      default = '0',
      description = 'The number of samples to use for multisample antialiasing.'
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
      arguments = { 'filename' },
      returns = { 'texture' }
    },
    {
      arguments = { 'width', 'height', 'projection', 'msaa' },
      returns = { 'texture' }
    }
  }
}
