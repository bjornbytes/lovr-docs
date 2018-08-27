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
    format = {
      type = 'TextureFormat',
      default = 'rgba',
      description = 'The format of the texture\'s pixels.'
    },
    filename = {
      type = 'string',
      description = 'The filename of the image to load.'
    },
    blob = {
      type = 'string',
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
      description = 'Load image data from a file.',
      arguments = { 'filename' },
      returns = { 'textureData' }
    },
    {
      description = 'Create an empty TextureData, initializing all color components to 0.',
      arguments = { 'width', 'height', 'format' },
      returns = { 'textureData' }
    },
    {
      description = 'Decode image data from a Blob.',
      arguments = { 'blob' },
      returns = { 'textureData' }
    }
  }
}
