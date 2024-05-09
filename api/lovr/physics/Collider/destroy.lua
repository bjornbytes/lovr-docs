return {
  summary = 'Destroy the Collider.',
  description = [[
    Destroys the Collider, removing it from the World and destroying all Shapes and Joints attached
    to it.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    After a Collider is destroyed, calling methods on it or passing it to a function will throw an
    error.
  ]],
  related = {
    'Collider:isDestroyed',
    'Collider:setEnabled',
    'World:destroy',
    'Shape:destroy',
    'Joint:destroy'
  }
}
