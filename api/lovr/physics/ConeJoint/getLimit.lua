return {
  summary = 'Get the angle limit of the ConeJoint.',
  description = [[
    Returns the angle limit of the ConeJoint.  The relative angle between the ConeJoint's axis and
    the second Collider will be constrained to this limit.
  ]],
  arguments = {},
  returns = {
    limit = {
      type = 'number',
      description = 'The angle limit, in radians.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'limit' }
    }
  },
  notes = 'The default limit is zero, preventing any rotation away from the axis.'
}
