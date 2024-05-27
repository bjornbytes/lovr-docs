return {
  summary = 'Set the priority of the Joint.',
  description = [[
    Sets the priority of the Joint.  Joints with a higher priority are more likely to be solved
    correctly.  Priority values are non-negative integers.
  ]],
  arguments = {
    priority = {
      type = 'number',
      description = 'The integer priority value.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'priority' },
      returns = {}
    }
  },
  notes = 'The default priority is zero.'
}
