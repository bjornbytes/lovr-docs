return {
  summary = 'Check if the Collider has been destroyed.',
  description = 'Returns whether the collider has been destroyed.',
  arguments = {},
  returns = {
    destroyed = {
      type = 'boolean',
      description = 'Whether the collider has been destroyed.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'destroyed' }
    }
  },
  notes = [[
    After a Collider is destroyed, calling methods on it or passing it to a function will throw an
    error.
  ]],
  related = {
    'Collider:destroy',
    'World:destroy',
    'Shape:destroy',
    'Joint:destroy'
  }
}
