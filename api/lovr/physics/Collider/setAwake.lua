return {
  summary = 'Put the Collider to sleep or wake it up.',
  description = 'Puts the Collider to sleep or wakes it up manually.',
  arguments = {
    awake = {
      type = 'boolean',
      description = 'Whether the Collider should be awake.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'awake' },
      returns = {}
    }
  },
  notes = [[
    This function can still be used to put a Collider to sleep even if automatic sleeping has been
    disabled with `Collider:setSleepingAllowed`.
  ]],
  related = {
    'Collider:isSleepingAllowed',
    'Collider:setSleepingAllowed'
  }
}
