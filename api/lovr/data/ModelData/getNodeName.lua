return {
  summary = 'Get the name of a node.',
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
  notes = 'If the node does not have a name, this function returns `nil`.'
}
