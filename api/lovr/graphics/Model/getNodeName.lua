return {
  summary = 'Get the name of a node in the Model.',
  description = 'Returns the name of a node.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the node.'
    }
  },
  returns = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the node.'
    }
  },
  related = {
    'Model:getNodeCount',
    'Model:getAnimationName',
    'Model:getMaterialName'
  }
}
