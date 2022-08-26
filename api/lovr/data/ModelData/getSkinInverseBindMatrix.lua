return {
  summary = 'Get the inverse bind matrix for a joint in the skin.',
  description = 'Returns the inverse bind matrix for a joint in the skin.',
  arguments = {
    {
      name = 'skin',
      type = 'number',
      description = 'The index of a skin.'
    },
    {
      name = 'joint',
      type = 'number',
      description = 'The index of a joint in the skin.'
    }
  },
  returns = {
    {
      name = '...',
      type = 'number',
      description = 'The 16 components of the 4x4 inverse bind matrix, in column-major order.'
    }
  }
}
