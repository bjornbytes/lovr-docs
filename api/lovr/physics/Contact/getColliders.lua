return {
  summary = 'Get the two Colliders that are in contact.',
  description = 'Returns the two Colliders that are in contact.',
  arguments = {},
  returns = {
    first = {
      type = 'Collider',
      description = 'The first collider.'
    },
    second = {
      type = 'Collider',
      description = 'The second collider.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'first', 'second' }
    }
  },
  related = {
    'Contact:getShapes'
  }
}
