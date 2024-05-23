return {
  summary = 'Check if the Collider is awake.',
  description = 'Returns whether the Collider is awake.',
  arguments = {},
  returns = {
    awake = {
      type = 'boolean',
      description = 'Whether the Collider is finally awake.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'awake' }
    }
  },
  notes = 'See `Collider:setSleepingAllowed` for notes about sleeping.',
  related = {
    'Collider:isSleepingAllowed',
    'Collider:setSleepingAllowed'
  }
}
