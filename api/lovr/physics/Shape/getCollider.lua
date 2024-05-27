return {
  summary = 'Get the Collider the Shape is attached to.',
  description = [[
    Returns the Collider the Shape is attached to.

    This function will return `nil` if the Shape is not attached to a Collider.  When a Shape isn't
    attached to a Collider, the Shape can still be used for queries with `World:overlapShape` and
    `World:shapecast`.
  ]],
  arguments = {},
  returns = {
    collider = {
      type = 'Collider',
      description = [[
        The Collider the Shape is attached to, or nil if the Shape isn't attached to a Collider.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'collider' }
    }
  },
  notes = 'A Shape can only be attached to one Collider at a time.',
  related = {
    'Collider',
    'Collider:getShape',
    'Collider:getShapes',
    'Collider:addShape',
    'Collider:removeShape'
  }
}
