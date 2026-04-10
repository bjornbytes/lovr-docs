return {
  summary = 'Get the conjugate of a quaternion.',
  description = [[
    Returns the conjugate, or inverse, of a quaternion.  This is a quaternion that does the opposite
    rotation of the original.
  ]],
  arguments = {
    q = {
      type = 'quaternion',
      description = 'The quaternion to invert.'
    }
  },
  returns = {
    r = {
      type = 'quaternion',
      description = 'The conjugate of the quaternion.'
    }
  },
  variants = {
    {
      arguments = { 'q' },
      returns = { 'r' }
    }
  },
  notes = 'This is shorthand for `quaternion(-q.x, -q.y, -q.z, q.w)`.'
}
