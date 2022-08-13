return {
  summary = 'Get the joints in a skin.',
  description = 'Returns a table with the node indices of the joints in a skin.',
  arguments = {
    {
      name = 'skin',
      type = 'number',
      description = 'The index of a skin.'
    }
  },
  returns = {
    {
      name = 'joints',
      type = 'table',
      description = 'The joints in the skin.'
    }
  }
}
