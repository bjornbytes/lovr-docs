return {
  summary = 'Get the size of the Pool.',
  description = 'Returns the size of the Pool, in bytes.',
  arguments = {},
  returns = {
    {
      name = 'size',
      type = 'number',
      description = 'The size of the Pool.'
    }
  },
  related = {
    'Pool:getUsage',
    'Pool:drain'
  }
}
