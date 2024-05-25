return {
  summary = 'Set the Collider\'s center of mass.',
  description = [[
    Sets the Collider's center of mass, in the Collider's local coordinate space.

    This does not change the Collider's position.
  ]],
  arguments = {
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
    },
    center = {
      type = 'Vec3',
      description = 'The center of mass.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      arguments = { 'center' },
      returns = {}
    }
  },
  notes = [[
    By default, the center of mass of the Collider is kept up to date automatically as the
    Collider's shapes change.  To disable this, use `Collider:setAutomaticMass`.

    Use `Collider:resetMassData` to reset the center and other mass properties based on the
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
