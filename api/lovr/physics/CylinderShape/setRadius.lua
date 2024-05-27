return {
  summary = 'Set the radius of the CylinderShape.',
  description = 'Sets the radius of the CylinderShape.',
  arguments = {
    radius = {
      type = 'number',
      description = 'The new radius, in meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'radius' },
      returns = {}
    }
  },
  notes = [[
    This changes the mass of the shape.  If the shape is attached to a collider with automatic mass
    enabled, the mass properties of the collider will update as well.

    Changing shapes can make the physics engine explode since it can cause objects to overlap in
    unnatural ways.
  ]],
  related = {
    'CylinderShape:getLength',
    'CylinderShape:setLength'
  }
}
