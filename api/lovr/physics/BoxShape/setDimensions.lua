return {
  summary = 'Set the dimensions of the BoxShape.',
  description = [[
    Sets the width, height, and depth of the BoxShape.

    This changes the mass of the shape.  If the shape is attached to a collider and that collider is
    set to use automatic mass, the mass properties of the collider will update as well.

    Changing shapes can make the physics engine explode since it can cause objects to overlap in
    unnatural ways.
  ]],
  arguments = {
    width = {
      type = 'number',
      description = 'The width of the box, in meters.'
    },
    height = {
      type = 'number',
      description = 'The height of the box, in meters.'
    },
    depth = {
      type = 'number',
      description = 'The depth of the box, in meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'width', 'height', 'depth' },
      returns = {}
    }
  }
}
