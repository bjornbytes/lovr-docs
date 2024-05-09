return {
  summary = 'Check if the Collider is enabled.',
  description = [[
    Returns whether the Collider is enabled.  When a Collider is disabled, it is removed from the
    World and does not impact the physics simulation in any way.  The Collider keeps all of its
    state and can be re-enabled to add it back to the World.
  ]],
  arguments = {},
  returns = {
    enabled = {
      type = 'boolean',
      description = 'Whether the Collider is enabled.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'enabled' }
    }
  },
  notes = 'Colliders are enabled when they are created.',
  related = {
    'Collider:destroy'
  }
}
