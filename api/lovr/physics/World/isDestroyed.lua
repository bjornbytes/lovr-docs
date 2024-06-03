return {
  summary = 'Check if the World has been destroyed.',
  description = [[
    Returns whether the World has been destroyed.  Destroyed worlds can not be used for anything.
  ]],
  arguments = {},
  returns = {
    destroyed = {
      type = 'boolean',
      description = 'Whether the World has been destroyed.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'destroyed' }
    }
  },
  related = {
    'World:destroy',
    'Collider:isDestroyed',
    'Shape:isDestroyed',
    'Joint:isDestroyed'
  }
}
