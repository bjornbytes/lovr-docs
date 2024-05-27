return {
  summary = 'Get the Colliders the Joint is attached to.',
  description = 'Returns the Colliders the Joint is attached to.',
  arguments = {},
  returns = {
    colliderA = {
      type = 'Collider',
      description = 'The first Collider.'
    },
    colliderB = {
      type = 'Collider',
      description = 'The second Collider.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'colliderA', 'colliderB' }
    }
  },
  related = {
    'Collider:getJoints'
  }
}
