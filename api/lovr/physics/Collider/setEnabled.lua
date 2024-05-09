return {
  summary = 'Enable or disable the Collider.',
  description = [[
    Enables or disables the Collider.  When a Collider is disabled, it is removed from the World and
    does not impact the physics simulation in any way.  The Collider keeps all of its state and can
    be re-enabled to add it back to the World.
  ]],
  arguments = {
    enable = {
      type = 'boolean',
      description = 'Whether the Collider should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  related = {
    'Collider:destroy'
  }
}
