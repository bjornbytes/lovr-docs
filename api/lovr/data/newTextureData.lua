return {
  summary = 'Create a new TextureData.',
  description = 'Creates a new TextureData with a given width and height or from an image file.',
  arguments = {
    width = {
      type = 'number',
      description = 'The width of the texture data.'
    },
    height = {
      type = 'number',
      description = 'The height of the texture data.'
    },
    filename = {
      type = 'string',
      description = 'The filename of the image to load.'
    },
    blob = {
      type = 'Blob',
      description = 'The Blob containing image data to decode.'
    }
  },
  returns = {
    textureData = {
      type = 'TextureData',
      description = 'The new TextureData.'
    }
  },
  variants = {
    {
      arguments = { 'filename' },
      returns = { 'textureData' }
    },
    {
      description = 'Create an empty TextureData, initializing all color components to 0.',
      arguments = { 'width', 'height' },
      returns = { 'textureData' }
    },
    {
      arguments = { 'blob' },
      returns = { 'textureData' }
    }
  }
}
