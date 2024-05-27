return {
  summary = 'Check if the Shape is destroyed.',
  description = [[
    Returns whether the Shape has been destroyed.  Destroyed shapes can not be used for anything.
  ]],
  arguments = {},
  returns = {
    destroyed = {
      type = 'boolean',
      description = 'Whether the Shape has been destroyed.'
    }
  },
  related = {
    'Shape:destroy',
    'Collider:isDestroyed',
    'Joint:isDestroyed',
    'World:isDestroyed'
  }
}
