return {
  summary = 'Get the amount of overlap between the colliders.',
  description = 'Returns the amount of overlap between the colliders.',
  arguments = {},
  returns = {
    overlap = {
      type = 'number',
      description = 'The amount of overlap, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'overlap' }
    }
  },
  related = {
    'Contact:getNormal'
  }
}
