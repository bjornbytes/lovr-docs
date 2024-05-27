return {
  summary = 'Enable or disable the Joint.',
  description = [[
    Enable or disable the Joint.  Disabled joints do not affect the simulation in any way.  If the
    Joint is no longer needed, `Joint:destroy` is a better option that completely removes the Joint
    from the simulation.
  ]],
  arguments = {
    enabled = {
      type = 'boolean',
      description = 'Whether the Joint should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enabled' },
      returns = {}
    }
  },
  related = {
    'Joint:destroy'
  }
}
