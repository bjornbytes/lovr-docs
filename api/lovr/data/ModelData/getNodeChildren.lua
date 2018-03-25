return {
  summary = 'Get the children of a node.',
  description = 'Returns the children of a node in the ModelData.',
  arguments = {
    index = {
      type = 'number',
      description = 'The index of the node to get the children of (1-indexed).'
    },
    table = {
      type = 'table',
      description = 'A table to fill with the children.'
    }
  },
  returns = {
    children = {
      type = 'table',
      description = 'A table of node indices representing the children of the node.'
    },
    table = {
      type = 'table',
      description = 'The supplied table.'
    }
  },
  variants = {
    {
      arguments = { 'index' },
      returns = { 'children' }
    },
    {
      arguments = { 'index', 'table' },
      returns = { 'table' }
    }
  },
  notes = 'An error will be thrown if an invalid node index is supplied.'
}
