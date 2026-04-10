return {
  summary = 'Get the direction of a quaternion.',
  description = [[
    Returns the direction of a quaternion.  It can also be thought of as rotating the forward vector
    by this quaternion.
  ]],
  arguments = {
    q = {
      type = 'quaternion',
      description = 'The quaternion to get the direction of.'
    }
  },
  returns = {
    direction = {
      type = 'vector',
      description = 'The direction this quaternion "faces".  It will be normalized.'
    }
  },
  variants = {
    {
      arguments = { 'q' },
      returns = { 'direction' }
    }
  },
  example = 'local dir = quaternion(collider:getOrientation()):direction()',
  related = {
    'quaternion.lookdir',
    'lovr.headset.getDirection'
  }
}
