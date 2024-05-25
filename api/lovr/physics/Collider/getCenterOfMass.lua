return {
  summary = 'Get the Collider\'s local center of mass.',
  description = [[
    Returns the Collider's center of mass, in the Collider's local coordinate space.
  ]],
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x component of the center of mass.'
    },
    y = {
      type = 'number',
      description = 'The y component of the center of mass.'
    },
    z = {
      type = 'number',
      description = 'The z component of the center of mass.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  notes = [[
    By default, the center of mass of the Collider is kept up to date automatically as the
    Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.

    Use `Collider:resetMassData` to reset the center of mass and other mass properties based on the
    Collider's shapes.
  ]],
  related = {
    'Shape:getCenterOfMass',
    'Collider:getMass',
    'Collider:setMass',
    'Collider:getInertia',
    'Collider:setInertia',
    'Collider:getAutomaticMass',
    'Collider:setAutomaticMass',
    'Collider:resetMassData',
    'Shape:getOffset',
    'Shape:setOffset'
  }
}
