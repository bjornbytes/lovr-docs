return {
  summary = 'Get the number of Images stored in the model.',
  description = 'Returns the number of Images in the model.',
  arguments = {},
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of Images in the model.'
    }
  },
  related = {
    'ModelData:getImage',
    'ModelData:getBlobCount'
  }
}
