return {
  summary = 'Set the radius of the SphereShape.',
  description = [[
    Sets the radius of the SphereShape.

    This changes the mass of the shape.  If the shape is attached to a collider and that collider is
    set to use automatic mass, the mass properties of the collider will update as well.

    Changing shapes can make the physics engine explode since it can cause objects to overlap in
    unnatural ways.
  ]],
  arguments = {
    radius = {
      type = 'number',
      description = 'The radius of the sphere, in meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'radius' },
      returns = {}
    }
  }
}
