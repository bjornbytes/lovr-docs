return {
  summary = 'Set the mass of the Collider.',
  description = [[
    Sets the mass of the Collider.

    The relative mass of colliders determines how they react when they collide.  A heavier collider
    has more momentum than a lighter collider moving the same speed, and will impart more force on
    the lighter collider.

    More generally, heavier colliders react less to forces they receive, including forces applied
    with functions like `Collider:applyForce`.

    Colliders with higher mass do not fall faster.  Use `Collider:setLinearDamping` to give a
    collider drag to make it fall slower or `Collider:setGravityScale` to change the way it reacts
    to gravity.
  ]],
  arguments = {
    mass = {
      type = 'number',
      description = 'The new mass for the Collider, in kilograms.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mass' },
      returns = {}
    }
  },
  notes = [[
    The mass must be positive.  Attempting to set a zero or negative mass will error.

    By default, the mass of the Collider is kept up to date automatically as the Collider's shapes
    change.  Use `Collider:setAutomaticMass` to disable this.

    Use `Collider:resetMassData` to reset the mass based on the Collider's shapes.

    If the Collider is kinematic or all translation axes are disabled, this function will do
    nothing.
  ]],
  related = {
    'Collider:getInertia',
    'Collider:setInertia',
    'Collider:getCenterOfMass',
    'Collider:setCenterOfMass',
    'Collider:getAutomaticMass',
    'Collider:setAutomaticMass',
    'Collider:resetMassData',
    'Shape:getDensity',
    'Shape:setDensity',
    'Shape:getVolume',
    'Shape:getMass'
  }
}
