return {
  summary = 'Get the first Shape attached to the Collider.',
  description = [[
    Returns a Shape attached to the Collider.

    For the common case where a Collider only has a single shape, this is more convenient and
    efficient than extracting it from the table returned by `Collider:getShapes`.  It is always
    equivalent to `Collider:getShapes()[1]`.
  ]],
  arguments = {},
  returns = {
    shape = {
      type = 'Shape',
      description = 'One of the `Shape` objects attached to the Collider.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'shapes' }
    }
  },
  notes = 'This may return `nil` if the Collider doesn\'t have any shapes attached to it.',
  example = [[
    function drawBoxCollider(pass, collider)
      local position = vec3(collider:getPosition())
      local size = vec3(collider:getShape():getDimensions())
      local orientation = quat(collider:getOrientation())
      pass:box(position, size, orientation)
    end
  ]],
  related = {
    'Collider:getShapes',
    'Collider:addShape',
    'Collider:removeShape',
    'Shape'
  }
}
