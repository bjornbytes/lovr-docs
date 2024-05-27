return {
  summary = 'Destroy the Shape.',
  description = 'Destroys the Shape, removing it from the Collider it\'s attached to.',
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    Calling methods on the Shape after destroying it will error (except for `Shape:isDestroyed`).

    If the Shape is attached to a Collider with automatic mass enabled, the collider's mass
    properties will update.
  ]],
  related = {
    'Shape:isDestroyed',
    'Collider:destroy',
    'Joint:destroy',
    'World:destroy'
  }
}
