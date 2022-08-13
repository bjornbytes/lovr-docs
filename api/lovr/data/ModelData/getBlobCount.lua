return {
  summary = 'Get the number of Blobs stored in the model.',
  description = 'Returns the number of Blobs in the model.',
  arguments = {},
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of Blobs in the model.'
    }
  },
  related = {
    'ModelData:getBlob',
    'ModelData:getImageCount'
  }
}
