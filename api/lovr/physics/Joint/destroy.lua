return {
  summary = 'Destroy the Joint.',
  description = [[
    Destroys the Joint, removing it from the World and breaking the connection between its
    Colliders.  There is no way to get the Joint back after destroying it, and attempting to use it
    will throw an error.  To temporarily disable a Joint, use `Joint:setEnabled`.
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
    Joints are automatically destroyed if either of their Colliders are destroyed or if the World is
    destroyed or garbage collected.
  ]],
  related = {
    'Joint:isDestroyed',
    'Joint:setEnabled',
    'Collider:destroy',
    'Shape:destroy',
    'World:destroy'
  }
}
