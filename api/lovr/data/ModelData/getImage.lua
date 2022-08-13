return {
  summary = 'Get an Image in the model.',
  description = 'Returns one of the Images in the model, by index.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the Image to get.'
    }
  },
  returns = {
    {
      name = 'image',
      type = 'Image',
      description = 'The Image object.'
    }
  },
  related = {
    'ModelData:getImageCount',
    'ModelData:getBlob'
  }
}
