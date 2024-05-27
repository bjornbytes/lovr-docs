return {
  summary = 'Set the length of the CylinderShape.',
  description = 'Sets the length of the CylinderShape.',
  arguments = {
    length = {
      type = 'number',
      description = 'The new length, in meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'length' },
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
    'CylinderShape:getRadius',
    'CylinderShape:setRadius'
  }
}
