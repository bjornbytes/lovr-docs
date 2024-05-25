return {
  summary = 'Reset mass properties.',
  description = [[
    Resets the mass, inertia, and center of mass of the Collider based on its attached shapes.

    If automatic mass is enabled, these properties will be kept up to date automatically.  Use this
    function when automatic mass is disabled or if mass needs to be reset after being overridden.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  related = {
    'Collider:getAutomaticMass',
    'Collider:setAutomaticMass',
    'Collider:getMass',
    'Collider:setMass',
    'Collider:getInertia',
    'Collider:setInertia',
    'Collider:getCenterOfMass',
    'Collider:setCenterOfMass'
  }
}
