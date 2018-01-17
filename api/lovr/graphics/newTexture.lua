return {
  tag = 'graphicsObjects',
  summary = 'Create a new Texture.',
  description = 'Creates a new Texture from an image file.',
  arguments = {
    {
      name = 'filename',
      type = 'string',
      description = 'The filename of the image to load.'
    }
  },
  returns = {
    {
      name = 'texture',
      type = 'Texture',
      description = 'The new Texture.'
    }
  }
}
