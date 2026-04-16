return {
  summary = 'Get the name of a node in the Model.',
  description = 'Returns the name of a node in the Model.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the node.'
    }
  },
  returns = {
    name = {
      type = 'string',
      description = 'The name of the node.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'name' }
    }
  },
  notes = 'If the node does not have a name, this function returns `nil`.',
  related = {
    'ModelData:getNodeName'
  }
}
