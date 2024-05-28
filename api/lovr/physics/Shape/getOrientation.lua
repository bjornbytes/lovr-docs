return {
  summary = 'Get the orientation of the Shape.',
  description = [[
    Get the orientation of the Shape in world space, taking into account the position and
    orientation of the Collider it's attached to, if any.  Shapes that aren't attached to a Collider
    will return their local offset.
  ]],
  arguments = {},
  returns = {
    angle = {
      type = 'number',
      description = 'The number of radians the Shape is rotated.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the rotation axis.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the rotation axis.'
    },
    az = {
      type = 'number',
      description = 'The z component of the rotation axis.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'angle', 'ax', 'ay', 'az' }
    }
  },
  related = {
    'Shape:getPosition',
    'Shape:getPose',
    'Shape:getOffset',
    'Shape:setOffset'
  }
}
