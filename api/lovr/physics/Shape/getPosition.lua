return {
  summary = 'Get the position of the Shape.',
  description = [[
    Returns the position of the Shape in world space, taking into the account the position and
    orientation of the Collider it's attached to, if any.  Shapes that aren't attached to a Collider
    will return their local offset.
  ]],
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x position, in world space.'
    },
    y = {
      type = 'number',
      description = 'The y position, in world space.'
    },
    z = {
      type = 'number',
      description = 'The z position, in world space.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Shape:getOrientation',
    'Shape:getPose',
    'Shape:getOffset',
    'Shape:setOffset'
  }
}
