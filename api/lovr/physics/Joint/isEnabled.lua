return {
  summary = 'Check if the Joint is enabled.',
  description = [[
    Returns whether the Joint is enabled.  Disabled joints do not affect the simulation in any way.
    Use `Joint:setEnabled` to reactivate the Joint later.  If the Joint is no longer needed,
    `Joint:destroy` is a better option that completely removes the Joint from the simulation.
  ]],
  arguments = {},
  returns = {
    enabled = {
      type = 'boolean',
      description = 'Whether the Joint is enabled.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'enabled' }
    }
  },
  related = {
    'Joint:destroy'
  }
}
