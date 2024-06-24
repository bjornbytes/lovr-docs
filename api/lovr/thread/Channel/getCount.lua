return {
  summary = 'Get the number of messages in the Channel.',
  description = 'Returns the number of messages in the Channel.',
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of messages in the Channel.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  }
}
