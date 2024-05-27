return {
  summary = 'Get the priority of the Joint.',
  description = [[
    Returns the priority of the Joint.  Joints with a higher priority are more likely to be solved
    correctly.  Priority values are non-negative integers.
  ]],
  arguments = {},
  returns = {
    priority = {
      type = 'number',
      description = 'The integer priority value.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'priority' }
    }
  },
  notes = 'The default priority is zero.'
}
