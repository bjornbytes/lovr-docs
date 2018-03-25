return {
  summary = 'Get the name of a node.',
  description = 'Returns the name of a node in the ModelData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the node to get the name of (1-indexed).'
    }
  },
  returns = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the node.'
    }
  },
  notes = 'An error will be thrown if an invalid node index is supplied.'
}
