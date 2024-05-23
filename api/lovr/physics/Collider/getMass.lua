return {
  summary = 'Get the mass of the Collider.',
  description = [[
    Returns the mass of the Collider.

    The relative mass of colliders determines how they react when they collide.  A heavier collider
    has more momentum than a lighter collider moving the same speed, and will impart more force on
    the lighter collider.

    More generally, heavier colliders react less to forces they receive, including forces applied
    with functions like `Collider:applyForce`.

    Colliders with higher mass do not fall faster.  Use `Collider:setLinearDamping` to give a
    collider drag to make it fall slower or `Collider:setGravityScale` to change the way it reacts
    to gravity.
  ]],
  arguments = {},
  returns = {
    mass = {
      type = 'number',
      description = 'The mass of the Collider, in kilograms.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mass' }
    }
  },
  notes = [[
    By default, the mass of the Collider will be kept up to date automatically as shapes are added
    and removed from the Collider (or when the shapes change size or density).  This can be disabled
    using `Collider:setAutomaticMass`.

    Mass can be overridden with `Collider:setMass`, or recomputed from the attached shapes with
    `Collider:resetMassData`.

    If the Collider is kinematic, this returns 0.

    If all translation axes have been disabled with `Collider:setEnabledAxes`, this returns 0.
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
