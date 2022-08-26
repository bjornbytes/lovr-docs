return {
  summary = 'Get a Blob in the model.',
  description = 'Returns one of the Blobs in the model, by index.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the Blob to get.'
    }
  },
  returns = {
    {
      name = 'blob',
      type = 'Blob',
      description = 'The Blob object.'
    }
  },
  related = {
    'ModelData:getBlobCount',
    'ModelData:getImage'
  }
}
