return {
  summary = 'Remove a Shape from the Collider.',
  description = 'Removes a Shape from the Collider.',
  arguments = {
    shape = {
      type = 'Shape',
      description = 'The Shape to remove.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'shape' },
      returns = {}
    }
  },
  notes = [[
    By default, LÖVR will recompute mass properties for the Collider as shapes are added and
    removed.  Use `Collider:setAutomaticMass` to enable or disable this behavior.

    It is valid for a Collider to have zero shapes, but due to a limitation of the physics engine
    LÖVR substitutes in a 1mm sphere so that the Collider still has mass.  It isn't advisable to
    keep these tiny spheres around.  Instead, prefer to quickly attach other shapes, or disable the
    Collider with `Collider:setEnabled`.
  ]],
  related = {
    'Collider:addShape',
    'Collider:getShapes',
    'Shape'
  }
}
