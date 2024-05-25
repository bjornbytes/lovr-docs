return {
  summary = 'Enable or disable automatic mass.',
  description = [[
    Enables or disables automatic mass for the Collider.

    When enabled, the Collider's mass, inertia, and center of mass will be recomputed when:

    - A shape is added to or removed from the Collider.
    - A shape attached to the Collider changes shape (e.g. `SphereShape:setRadius`).
    - A shape attached to the Collider is moved using `Shape:setOffset`.
    - A shape attached to the Collider changes its density using `Shape:setDensity`.

    Additionally, changing the center of mass of a Collider will automatically update its inertia
    when automatic mass is enabled.

    Disable this to manage the mass properties manually.  When automatic mass is disabled,
    `Collider:resetMassData` can still be used to reset the mass from attached shapes if needed.
  ]],
  arguments = {
    enable = {
      type = 'boolean',
      description = 'Whether automatic mass should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  related = {
    'Collider:resetMassData',
    'Collider:getMass',
    'Collider:setMass',
    'Collider:getInertia',
    'Collider:setInertia',
    'Collider:getCenterOfMass',
    'Collider:setCenterOfMass'
  }
}
