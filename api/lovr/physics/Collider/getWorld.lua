return {
  summary = 'Get the World the Collider is in.',
  description = 'Returns the World the Collider is in.',
  arguments = {},
  returns = {
    world = {
      type = 'World',
      description = 'The World the Collider is in.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'world' }
    }
  },
  notes = 'Colliders can only ever be in the World that created them.'
}
