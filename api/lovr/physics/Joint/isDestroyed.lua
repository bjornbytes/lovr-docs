return {
  summary = 'Check if a Joint is destroyed.',
  description = [[
    Returns whether a Joint has been destroyed.  This the only method that can be called on a
    destroyed Joint, using the Joint in any other way will error.
  ]],
  arguments = {},
  returns = {
    destroyed = {
      type = 'boolean',
      description = 'Whether the Joint has been destroyed.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'destroyed' }
    }
  },
  related = {
    'Joint:destroy',
    'Joint:isEnabled',
    'Joint:setEnabled',
    'Collider:destroy',
    'Shape:destroy',
    'World:destroy'
  }
}
