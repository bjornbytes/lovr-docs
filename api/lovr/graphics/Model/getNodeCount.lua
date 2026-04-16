return {
  summary = 'Get the number of nodes in the Model.',
  description = 'Returns the number of nodes in the Model.',
  arguments = {},
  returns = {
    count = {
      type = 'number',
      description = 'The number of nodes in the Model.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'count' }
    }
  },
  related = {
    'ModelData:getNodeCount'
  }
}
