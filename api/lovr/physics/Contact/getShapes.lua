return {
  summary = 'Get the two Shapes that are in contact.',
  description = 'Returns the two Shapes that are in contact.',
  arguments = {},
  returns = {
    first = {
      type = 'Shape',
      description = 'The first shape.'
    },
    second = {
      type = 'Shape',
      description = 'The second shape.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'first', 'second' }
    }
  },
  related = {
    'Contact:getColliders'
  }
}
